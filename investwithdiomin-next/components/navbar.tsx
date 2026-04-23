"use client";

import { BarChart3, Instagram } from "lucide-react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { cn } from "@/lib/utils";

const links = [
  { href: "/", label: "Home" },
  { href: "/services", label: "Services" },
  { href: "/real-estate", label: "Real Estate" },
  { href: "/bio", label: "Bio" },
  { href: "/blog", label: "Blog" },
  { href: "/contact", label: "Contact" }
];

export function Navbar({ onBook }: { onBook: () => void }) {
  const pathname = usePathname();

  return (
    <header className="nav">
      <div className="container nav-inner">
        <Link href="/" className="brand">
          <div className="brand-mark">
            <BarChart3 size={24} />
          </div>
          <div>
            <div className="brand-title">InvestWithDiomin</div>
            <div className="brand-sub">PRIVATE WEALTH ADVISORY</div>
          </div>
        </Link>

        <nav className="nav-links">
          {links.map((link) => (
            <Link
              key={link.href}
              href={link.href}
              className={cn("nav-link", pathname === link.href && "active")}
            >
              {link.label}
            </Link>
          ))}
        </nav>

        <div className="nav-actions">
          <a
            href="https://www.instagram.com/investwithdiomin/"
            target="_blank"
            rel="noreferrer"
            className="icon-button"
            aria-label="Instagram"
          >
            <Instagram size={18} />
          </a>
          <button className="button primary small" onClick={onBook}>
            Book Call
          </button>
        </div>
      </div>
    </header>
  );
}
