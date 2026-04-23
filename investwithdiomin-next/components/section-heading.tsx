export function SectionHeading({
  kicker,
  title,
  description
}: {
  kicker: string;
  title: string;
  description?: string;
}) {
  return (
    <div className="section-heading">
      <div className="eyebrow">{kicker}</div>
      <h2>{title}</h2>
      {description ? <p>{description}</p> : null}
    </div>
  );
}
