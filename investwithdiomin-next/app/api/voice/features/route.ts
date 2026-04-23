import { NextResponse } from "next/server";

export async function GET() {
  return NextResponse.json({
    provider: "ElevenLabs",
    features: [
      "Voice generation",
      "Deterministic cache by text+voice hash",
      "Cache hit/miss observability",
      "Runtime-configurable cache directory",
      "Secure server-side secret usage"
    ]
  });
}
