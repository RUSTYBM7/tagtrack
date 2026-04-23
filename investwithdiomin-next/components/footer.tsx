"use client";

import { Instagram, Linkedin, Play, Twitter } from "lucide-react";
import Image from "next/image";

export function Footer({ onBook }: { onBook: () => void }) {
  return (
    <footer className="footer">
      <div className="container">
        <section className="footer-cta">
          <div className="pill">NOW ACCEPTING PRIVATE CLIENTS</div>
          <h2>Invest with confidence.</h2>
          <p>
            Private capital. Artificial intelligence. Global infrastructure.
            Cryptocurrency leveraging. Real estate investment.
          </p>
          <div className="footer-cta-actions">
            <button className="button primary" onClick={onBook}>
              Begin Your Journey
            </button>
            <button className="button ghost">
              <Play size={16} />
              Watch 2:14 video
            </button>
          </div>
        </section>

        <section className="footer-grid">
          <div>
            <div className="footer-profile">
              <Image
                src="https://i.ibb.co/2YqgLBzx/your-image.png"
                alt="Stephanie Diomin"
                width={84}
                height={84}
                className="footer-avatar"
              />
              <div>
                <h3>Stephanie Diomin CPWA®️</h3>
                <p>Financial Analyst • Senior Business Advisor • Realtor</p>
                <span>Xcloudmultixpro Initiatives | OrbitCare Union</span>
              </div>
            </div>
          </div>

          <div>
            <div className="footer-label">PHONE - TEXT</div>
            <a href="tel:+15092946731">+1 (509) 294-6731</a>
            <div className="footer-label">EMAIL</div>
            <a href="mailto:stephcpwa@att.net">stephcpwa@att.net</a>
            <div className="footer-label">WEBSITE</div>
            <a href="https://investwithdiomin.today" target="_blank" rel="noreferrer">
              investwithdiomin.today
            </a>
          </div>

          <div>
            <div className="footer-label">LOCATIONS</div>
            <p>United States • Canada • United Kingdom • Australia</p>
            <div className="footer-label footer-space">EXPERTISE</div>
            <div className="tag-row">
              {[
                "Private Capital",
                "Artificial Intelligence",
                "Financial Analysis",
                "Infrastructure",
                "Global Risk",
                "Crypto Investor"
              ].map((item) => (
                <span key={item} className="tag">
                  {item}
                </span>
              ))}
            </div>
          </div>
        </section>

        <section className="footer-bottom">
          <div>© 2026 Stephanie Diomin. All rights reserved.</div>
          <div className="footer-links">
            <a href="#">Privacy</a>
            <a href="#">Legal</a>
            <a href="#">Disclosures</a>
          </div>
          <div className="footer-social">
            <a href="https://instagram.com/investwithdiomin" target="_blank" rel="noreferrer"><Instagram size={16} /></a>
            <a href="#"><Twitter size={16} /></a>
            <a href="#"><Linkedin size={16} /></a>
          </div>
        </section>
      </div>
    </footer>
  );
}
