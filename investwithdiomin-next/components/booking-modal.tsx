"use client";

import { X } from "lucide-react";
import { useEffect, useState } from "react";

type Props = {
  open: boolean;
  onClose: () => void;
};

export function BookingModal({ open, onClose }: Props) {
  const [submitted, setSubmitted] = useState(false);

  useEffect(() => {
    if (!open) setSubmitted(false);
  }, [open]);

  useEffect(() => {
    const handler = (e: KeyboardEvent) => {
      if (e.key === "Escape") onClose();
    };
    if (open) window.addEventListener("keydown", handler);
    return () => window.removeEventListener("keydown", handler);
  }, [open, onClose]);

  if (!open) return null;

  return (
    <div className="modal-backdrop" onClick={onClose}>
      <div className="modal-card" onClick={(e) => e.stopPropagation()}>
        <div className="modal-head">
          <div>
            <h3>Book Strategy Call</h3>
            <p>30 minutes • Complimentary</p>
          </div>
          <button className="icon-button" onClick={onClose} aria-label="Close">
            <X size={18} />
          </button>
        </div>

        {submitted ? (
          <div className="modal-success">
            <h4>Request received</h4>
            <p>Steph or her team will follow up shortly.</p>
          </div>
        ) : (
          <form
            className="modal-form"
            onSubmit={(e) => {
              e.preventDefault();
              setSubmitted(true);
            }}
          >
            <input className="input" placeholder="Full Name" required />
            <div className="input-grid">
              <input className="input" type="email" placeholder="Email" required />
              <input className="input" placeholder="Phone" />
            </div>
            <select className="input" required defaultValue="">
              <option value="" disabled>Select service area</option>
              <option value="crypto">Cryptocurrency Investment</option>
              <option value="real-estate">Real Estate Portfolio</option>
              <option value="recovery">Funds & Crypto Recovery</option>
              <option value="courses">Financial Courses</option>
            </select>
            <button className="button primary wide" type="submit">
              Request Call Slot
            </button>
          </form>
        )}
      </div>
    </div>
  );
}
