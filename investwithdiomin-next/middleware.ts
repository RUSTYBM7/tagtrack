import { NextRequest, NextResponse } from "next/server";

function unauthorizedResponse() {
  return new NextResponse("Authentication required", {
    status: 401,
    headers: {
      "WWW-Authenticate": 'Basic realm="Secure Area"'
    }
  });
}

function isAssetRequest(pathname: string) {
  return (
    pathname.startsWith("/_next") ||
    pathname.startsWith("/favicon") ||
    pathname.startsWith("/api/voice")
  );
}

export function middleware(req: NextRequest) {
  const privateMode = process.env.PRIVATE_MODE === "true";
  if (!privateMode || isAssetRequest(req.nextUrl.pathname)) {
    return NextResponse.next();
  }

  const authHeader = req.headers.get("authorization");
  if (!authHeader?.startsWith("Basic ")) {
    return unauthorizedResponse();
  }

  const encoded = authHeader.replace("Basic ", "");
  const decoded = atob(encoded);
  const [username, password] = decoded.split(":");

  if (
    username !== process.env.PRIVATE_MODE_USERNAME ||
    password !== process.env.PRIVATE_MODE_PASSWORD
  ) {
    return unauthorizedResponse();
  }

  return NextResponse.next();
}

export const config = {
  matcher: ["/((?!_next/static|_next/image|robots.txt|sitemap.xml).*)"]
};
