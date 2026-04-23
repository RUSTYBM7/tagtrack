"use client";

import { useState } from "react";
import { BookingModal } from "@/components/booking-modal";
import { Footer } from "@/components/footer";
import { Navbar } from "@/components/navbar";

export function SiteShell({ children }: { children: React.ReactNode }) {
  const [open, setOpen] = useState(false);

  return (
    <>
      <Navbar onBook={() => setOpen(true)} />
      <main>{children}</main>
      <Footer onBook={() => setOpen(true)} />
      <BookingModal open={open} onClose={() => setOpen(false)} />
    </>
  );
}
