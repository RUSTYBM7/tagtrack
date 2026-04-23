import { PageHero } from "@/components/page-hero";
import { blogPosts } from "@/data/site";

export default function BlogPage() {
  return (
    <>
      <PageHero
        eyebrow="FROM THE DESK OF STEPH"
        title="Blog & Investment Insights"
        description="Thoughts, strategies, and real-world lessons from building wealth for 340+ families."
      />

      <section className="section">
        <div className="container card-grid two">
          {blogPosts.map((post) => (
            <article className="info-card" key={post.title}>
              <div className="card-top">
                <span className="mini-tag">{post.tag}</span>
                <span>{post.date}</span>
              </div>
              <h3>{post.title}</h3>
              <p>{post.excerpt}</p>
            </article>
          ))}
        </div>
      </section>
    </>
  );
}
