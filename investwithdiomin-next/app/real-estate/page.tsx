import Image from "next/image";
import { PageHero } from "@/components/page-hero";

const properties = [
  {
    title: "Modern Waterfront Estate",
    meta: "Isle of Palms, SC • 5 Beds • 6.5 Baths • 6,200 sq ft",
    price: "$5.1M",
    image: "https://picsum.photos/id/1018/900/560"
  },
  {
    title: "Luxury Charleston Single-Family",
    meta: "Charleston, SC • 4 Beds • 4.5 Baths • 4,800 sq ft",
    price: "$2.85M",
    image: "https://picsum.photos/id/160/900/560"
  },
  {
    title: "Hilton Head Island Villa",
    meta: "Hilton Head, SC • 3 Beds • 3.5 Baths • 2,900 sq ft",
    price: "$1.65M",
    image: "https://picsum.photos/id/1033/900/560"
  }
];

export default function RealEstatePage() {
  return (
    <>
      <PageHero
        eyebrow="LICENSED REALTOR • COLDWELL BANKER REALTY (SC/NC)"
        title="Premium Real Estate Portfolio"
        description="Hand-selected properties and opportunities across the Southeast and beyond."
      />

      <section className="section">
        <div className="container card-grid three">
          {properties.map((property) => (
            <article className="property-card" key={property.title}>
              <Image
                src={property.image}
                alt={property.title}
                width={900}
                height={560}
                className="property-image"
              />
              <div className="property-body">
                <h3>{property.title}</h3>
                <p>{property.meta}</p>
                <strong className="price">{property.price}</strong>
              </div>
            </article>
          ))}
        </div>
      </section>
    </>
  );
}
