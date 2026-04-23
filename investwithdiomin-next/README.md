# InvestWithDiomin – Secure Platform (Voice-Cached)

A private-first Next.js 15 platform for advisory workflows, analytics gating, and voice generation with deterministic caching.

## Project layout

- `app/` – App Router pages and API endpoints
- `components/` – reusable UI and analytics loader
- `lib/voice-cache.ts` – SHA-256 voice cache helpers
- `lib/server-auth.ts` – bearer-token protection for admin/pitch/crm APIs
- `middleware.ts` – optional global private-mode basic auth

## Security model

1. **Private mode**
   - Controlled by `PRIVATE_MODE=true`
   - Uses HTTP Basic Auth via middleware
2. **Protected APIs**
   - `ADMIN_API_TOKEN`, `PITCH_API_TOKEN`, and `CRM_API_TOKEN` secure internal APIs
3. **Analytics gating**
   - Analytics load only when explicitly enabled with `NEXT_PUBLIC_ENABLE_ANALYTICS=true`

## ElevenLabs voice caching

- Endpoint: `POST /api/voice/generate`
- Cache key: `sha256(voiceId + ':' + text)`
- Cache directory: `ELEVENLABS_CACHE_DIR` (defaults to `.voice-cache`)
- Response header:
  - `X-Cache: HIT` (served from cache)
  - `X-Cache: MISS` (generated and cached)

## Local setup

```bash
cp .env.example .env.local
npm install
npm run dev
```

## Notes

- Keep all secrets in environment variables.
- `.voice-cache` is git-ignored and safe for local/Vercel ephemeral usage.
- For persistent cache, swap file storage to S3/R2 in `lib/voice-cache.ts`.
