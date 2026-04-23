import { NextRequest, NextResponse } from "next/server";
import { requireApiToken } from "@/lib/server-auth";

type LeadRequest = {
  name?: string;
  email?: string;
  intent?: string;
};

export async function POST(req: NextRequest) {
  const authError = requireApiToken(req, "CRM_API_TOKEN");
  if (authError) return authError;

  const body = (await req.json()) as LeadRequest;

  if (!body.name || !body.email) {
    return NextResponse.json({ error: "name and email are required." }, { status: 400 });
  }

  return NextResponse.json(
    {
      accepted: true,
      lead: {
        name: body.name,
        email: body.email,
        intent: body.intent ?? "general",
        source: "secure-platform"
      }
    },
    { status: 201 }
  );
}
