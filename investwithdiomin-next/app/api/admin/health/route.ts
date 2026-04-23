import { NextRequest, NextResponse } from "next/server";
import { requireApiToken } from "@/lib/server-auth";

export async function GET(req: NextRequest) {
  const authError = requireApiToken(req, "ADMIN_API_TOKEN");
  if (authError) return authError;

  return NextResponse.json({
    status: "ok",
    service: "admin",
    timestamp: new Date().toISOString()
  });
}
