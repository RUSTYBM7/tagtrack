import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import { SiteShell } from "@/components/site-shell";
import { Analytics } from "@/components/analytics";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "InvestWithDiomin",
  description: "Private wealth advisory, real estate, crypto, and strategic investment services."
};

export default function RootLayout({
  children
}: Readonly<{ children: React.ReactNode }>) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <Analytics />
        <SiteShell>{children}</SiteShell>
      </body>
    </html>
  );
}
