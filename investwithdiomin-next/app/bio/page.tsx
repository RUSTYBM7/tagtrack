import Image from "next/image";
import { PageHero } from "@/components/page-hero";

const timeline = [
  "1988 — Born April 5 in Los Angeles, CA",
  "2010 — UCLA Graduation + First Role at Major Bank",
  "2013 — MBA + Marriage to Manuel",
  "2018–2020 — CPWA® + Launch of Invest With Steph",
  "2023 — OrbitCare Launch + Real Estate License + Move to SC",
  "2026 — 340+ Families Guided"
];

export default function BioPage() {
  return (
    <>
      <PageHero
        eyebrow="BORN APRIL 5, 1988 • MARRIED TO MANUEL • MOTHER OF 4"
        title="How It All Started"
        description="The full story of Stephanie Alvina Diomin — from Los Angeles roots to building generational wealth for hundreds of families."
        centered
      />

      <section className="section">
        <div className="container split">
          <div className="bio-image-wrap">
            <Image
              src="https://picsum.photos/id/1005/760/900"
              alt="Stephanie Alvina Diomin"
              width={760}
              height={900}
              className="bio-image"
            />
          </div>

          <div>
            <h2 className="subhead">The Story</h2>
            <p className="body-copy">
              Born in Los Angeles to a Colombian mother and American father,
              Stephanie grew up between two powerful cultures that shaped her
              approach to resilience, discipline, and community capital.
            </p>
            <p className="body-copy">
              Today she lives in South Carolina with her husband Manuel and
              their four children, serving investors through wealth advisory,
              real estate, and premium strategic planning.
            </p>
          </div>
        </div>
      </section>

      <section className="section alt">
        <div className="container narrow">
          <h2 className="subhead">The Journey</h2>
          <div className="timeline">
            {timeline.map((item) => (
              <div className="timeline-item" key={item}>
                <span className="timeline-dot" />
                <p>{item}</p>
              </div>
            ))}
          </div>
        </div>
      </section>
    </>
  );
}
