import { NextRequest, NextResponse } from "next/server";
import { createVoiceCacheKey, readVoiceFromCache, writeVoiceToCache } from "@/lib/voice-cache";

export const runtime = "nodejs";

export async function POST(req: NextRequest) {
  const apiKey = process.env.ELEVENLABS_API_KEY;
  const defaultVoiceId = process.env.ELEVENLABS_VOICE_ID;
  const modelId = process.env.ELEVENLABS_MODEL_ID ?? "eleven_multilingual_v2";

  if (!apiKey || !defaultVoiceId) {
    return NextResponse.json({ error: "ElevenLabs is not configured." }, { status: 500 });
  }

  const body = (await req.json()) as { text?: string; voiceId?: string };
  const text = body.text?.trim();
  const voiceId = body.voiceId?.trim() || defaultVoiceId;

  if (!text) {
    return NextResponse.json({ error: "Text is required." }, { status: 400 });
  }

  const cacheKey = createVoiceCacheKey({ text, voiceId });
  const cachedAudio = await readVoiceFromCache(cacheKey);

  if (cachedAudio) {
    return new NextResponse(cachedAudio, {
      status: 200,
      headers: {
        "Content-Type": "audio/mpeg",
        "Cache-Control": "private, max-age=31536000, immutable",
        "X-Cache": "HIT"
      }
    });
  }

  const elevenLabsResponse = await fetch(`https://api.elevenlabs.io/v1/text-to-speech/${voiceId}`, {
    method: "POST",
    headers: {
      "xi-api-key": apiKey,
      "Content-Type": "application/json",
      Accept: "audio/mpeg"
    },
    body: JSON.stringify({ model_id: modelId, text })
  });

  if (!elevenLabsResponse.ok) {
    const reason = await elevenLabsResponse.text();
    return NextResponse.json({ error: "Failed to generate audio.", reason }, { status: 502 });
  }

  const audioBuffer = Buffer.from(await elevenLabsResponse.arrayBuffer());
  await writeVoiceToCache(cacheKey, audioBuffer);

  return new NextResponse(audioBuffer, {
    status: 200,
    headers: {
      "Content-Type": "audio/mpeg",
      "Cache-Control": "private, max-age=31536000, immutable",
      "X-Cache": "MISS"
    }
  });
}
