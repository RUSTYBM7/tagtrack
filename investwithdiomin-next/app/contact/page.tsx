"use client";

import { useState } from "react";
import { PageHero } from "@/components/page-hero";

export default function ContactPage() {
  const [sent, setSent] = useState(false);

  return (
    <>
      <PageHero
        eyebrow="LET’S CONNECT"
        title="Get in Touch with Steph"
        description="Whether you're ready to book a strategy call or want to discuss real estate, courses, or recovery support."
        centered
      />

      <section className="section">
        <div className="container narrow">
          <div className="contact-grid">
            <a className="info-card" href="tel:+15092946731">
              <h3>Call / Text / iMessage</h3>
              <p>(509) 294-6731</p>
            </a>
            <a className="info-card" href="mailto:stephcpwa@att.net">
              <h3>Email Steph Directly</h3>
              <p>stephcpwa@att.net</p>
            </a>
          </div>

          <form
            className="contact-form"
            onSubmit={(e) => {
              e.preventDefault();
              setSent(true);
            }}
          >
            <div className="input-grid">
              <input className="input" placeholder="Your Name" required />
              <input className="input" type="email" placeholder="Your Email" required />
            </div>
            <textarea
              className="input textarea"
              placeholder="How can I help you today?"
              required
            />
            <button className="button primary wide" type="submit">
              {sent ? "Message Sent" : "Send Message to Steph"}
            </button>
          </form>
        </div>
      </section>
    </>
  );
}
