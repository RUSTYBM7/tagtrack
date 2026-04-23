import { Building2, Globe2, Landmark, ShieldCheck } from "lucide-react";
import Image from "next/image";
import { SectionHeading } from "@/components/section-heading";
import { blogPosts, faqs, testimonials } from "@/data/site";

export default function HomePage() {
  return (
    <>
      <section className="hero">
        <div className="container hero-grid">
          <div>
            <div className="hero-pill">
              <span className="status-dot" />
              SAN FRANCISCO • SERVING CLIENTS NATIONWIDE
            </div>
            <h1>
              Clarity.<br />
              Discipline.<br />
              <span>Legacy Wealth.</span>
            </h1>
            <p>
              Build generational wealth with a cleaner, calmer advisory
              framework across crypto, real estate, and private capital strategy.
            </p>
            <div className="hero-actions">
              <a href="/services" className="button primary">Explore Services</a>
              <a href="/contact" className="button ghost">Contact Steph</a>
              <a href="/contact" className="button glass">Private Access Request</a>
            </div>
          </div>

          <div className="hero-card">
            <Image
              src="https://picsum.photos/id/1005/800/920"
              alt="Stephanie Alvina Diomin"
              width={800}
              height={920}
              className="hero-image"
            />
          </div>
        </div>
      </section>

      <section className="trustbar">
        <div className="container trustbar-grid">
          <div><ShieldCheck size={18} /> CPWA® Certified</div>
          <div><Landmark size={18} /> Founder • Invest With Steph</div>
          <div><Building2 size={18} /> Realtor • Coldwell Banker (SC/NC)</div>
          <div><Globe2 size={18} /> US • Canada • UK • Australia</div>
        </div>
      </section>

      <section className="section">
        <div className="container split">
          <div>
            <SectionHeading
              kicker="YOUR TRUSTED GUIDE"
              title="Stephanie Alvina Diomin, CPWA®"
              description="With a decade-plus focus on affluent and growth-minded investors, Stephanie brings a high-trust, high-touch advisory style centered on asymmetry, downside awareness, and calm execution."
            />
            <p className="body-copy">
              Her investment lens blends premium real estate, digital assets,
              and strategic portfolio architecture to help clients move from
              scattered decisions to a more coherent long-term plan.
            </p>
          </div>

          <div className="metric-grid">
            <div className="metric-card"><strong>$2.8B</strong><span>Assets Under Advisement</span></div>
            <div className="metric-card"><strong>340+</strong><span>Families Guided</span></div>
            <div className="metric-card"><strong>47%</strong><span>Avg 3-Year Portfolio Growth</span></div>
            <div className="metric-card"><strong>98%</strong><span>Client Retention Rate</span></div>
          </div>
        </div>
      </section>

      <section className="section">
        <div className="container">
          <SectionHeading
            kicker="FROM THE DESK OF STEPH"
            title="Latest Investment Insights"
          />
          <div className="card-grid three">
            {blogPosts.slice(0, 3).map((post) => (
              <article key={post.title} className="info-card">
                <div className="card-top">
                  <span className="mini-tag">{post.tag}</span>
                  <span>{post.date}</span>
                </div>
                <h3>{post.title}</h3>
                <p>{post.excerpt}</p>
              </article>
            ))}
          </div>
        </div>
      </section>

      <section className="section alt">
        <div className="container">
          <SectionHeading
            kicker="DON’T TAKE MY WORD FOR IT"
            title="What My Clients Say"
          />
          <div className="testimonial-stack">
            {testimonials.map((item) => (
              <article className="testimonial" key={item.name}>
                <p>“{item.quote}”</p>
                <strong>{item.name}</strong>
                <span>{item.role}</span>
              </article>
            ))}
          </div>
        </div>
      </section>

      <section className="section">
        <div className="container narrow">
          <SectionHeading
            kicker="FREQUENTLY ASKED QUESTIONS"
            title="Common Questions"
          />
          <div className="faq-list">
            {faqs.map((item) => (
              <div className="faq-item" key={item.q}>
                <h3>{item.q}</h3>
                <p>{item.a}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      <section className="section alt">
        <div className="container">
          <SectionHeading
            kicker="SECURE PLATFORM"
            title="Built for private clients and protected workflows"
            description="A private-mode stack with protected sessions, gated analytics, and deterministic AI voice delivery with cost-aware caching."
          />
          <div className="card-grid three">
            <article className="info-card">
              <h3>Private-Mode Enforcement</h3>
              <p>Restrict public access with environment-based authentication while preserving secure API operations.</p>
            </article>
            <article className="info-card">
              <h3>Gated Analytics</h3>
              <p>Enable PostHog, GTM, and Contentsquare only when explicitly configured for controlled observability.</p>
            </article>
            <article className="info-card">
              <h3>Voice Cache Acceleration</h3>
              <p>SHA-256 keyed audio caching reduces repeated ElevenLabs generation cost and speeds repeat playback.</p>
            </article>
            <article className="info-card">
              <h3>Protected Pitch Endpoint</h3>
              <p>Token-protected endpoint for generating strategic investor pitch summaries without public exposure.</p>
            </article>
            <article className="info-card">
              <h3>CRM Lead Intake Security</h3>
              <p>Bearer-token-gated lead ingestion route to safely connect private CRM workflows.</p>
            </article>
          </div>
        </div>
      </section>
    </>
  );
}
