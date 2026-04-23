import { PageHero } from "@/components/page-hero";

const services = [
  "Portfolio Construction",
  "On-Chain Intelligence",
  "Custody & Security",
  "Tax Optimization",
  "Recovery Support",
  "Quarterly Reviews"
];

const courses = [
  { title: "The Wealth Blueprint", price: "$2,497" },
  { title: "Crypto Mastery Intensive", price: "$1,497" },
  { title: "Real Estate Empire Builder", price: "$1,997" },
  { title: "Crypto & Fund Recovery Playbook", price: "$997" }
];

export default function ServicesPage() {
  return (
    <>
      <PageHero
        eyebrow="COMPREHENSIVE WEALTH SOLUTIONS"
        title="Services Designed for Serious Investors"
        description="From institutional-grade crypto strategies to premium real estate and educational programs."
      />

      <section className="section">
        <div className="container card-grid two">
          {services.map((item) => (
            <div className="info-card" key={item}>
              <h3>{item}</h3>
              <p>Premium advisory delivered with a clean, high-trust client experience.</p>
            </div>
          ))}
        </div>
      </section>

      <section className="section alt">
        <div className="container">
          <div className="section-heading">
            <div className="eyebrow">INVESTOR EDUCATION</div>
            <h2>Mini Marketplace — Courses for Sale</h2>
          </div>
          <div className="card-grid four">
            {courses.map((course) => (
              <div className="info-card" key={course.title}>
                <h3>{course.title}</h3>
                <p>Lifetime updates, structured learning, and practical investor frameworks.</p>
                <strong className="price">{course.price}</strong>
              </div>
            ))}
          </div>
        </div>
      </section>
    </>
  );
}
