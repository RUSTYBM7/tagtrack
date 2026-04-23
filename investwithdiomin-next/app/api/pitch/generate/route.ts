import { NextRequest, NextResponse } from "next/server";
import { requireApiToken } from "@/lib/server-auth";

type PitchBody = {
  clientName?: string;
  objective?: string;
  riskProfile?: "conservative" | "moderate" | "aggressive";
};

export async function POST(req: NextRequest) {
  const authError = requireApiToken(req, "PITCH_API_TOKEN");
  if (authError) return authError;

  const body = (await req.json()) as PitchBody;

  if (!body.clientName || !body.objective) {
    return NextResponse.json({ error: "clientName and objective are required." }, { status: 400 });
  }

  const riskProfile = body.riskProfile ?? "moderate";

  return NextResponse.json({
    title: `Strategic Plan for ${body.clientName}`,
    summary: `Objective: ${body.objective}. Recommended cadence: quarterly reviews with ${riskProfile} risk positioning.`,
    nextActions: [
      "Portfolio baseline review",
      "Tax-aware asset mapping",
      "Cashflow and reserve calibration"
    ]
  });
}
