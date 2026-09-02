[9/1/2026 9:47 AM] Pisey: # AI Marketing Video Generator — Full Build Spec

## Project Summary

Build a full-stack web app that lets small business owners (starting in Cambodia) upload a product photo or video, and generates a short marketing video: an AI-written script, AI voiceover, and a small talking-avatar overlay on top of the user's real product footage.

Core differentiator: the avatar is a small bubble, bottom-left corner, not full-screen — the real product stays large and centered, like a cooking-show layout. This must be reflected in the UI mockups and in the final video composition logic.

---

## Tech Stack

- Frontend: React + Vite, Tailwind CSS
- Backend: Node.js + Express
- AI text/vision: Anthropic Claude API (claude-sonnet-4-6)
- Voice: ElevenLabs API
- Avatar video: D-ID API (pay-per-use, cheaper than HeyGen for early testing)
- File storage: local /uploads folder for MVP (swap to S3-compatible storage later)
- Video composition: ffmpeg (server-side, to overlay avatar bubble onto uploaded product footage)

---

## Environment Variables (.env)

# Server

PORT=4000
NODE_ENV=development

# Anthropic

ANTHROPIC_API_KEY=your_key_here
ANTHROPIC_MODEL=claude-sonnet-4-6

# ElevenLabs

ELEVENLABS_API_KEY=your_key_here
ELEVENLABS_VOICE_ID=default_voice_id_here

# D-ID (avatar video)

DID_API_KEY=your_key_here
DID_AVATAR_IMAGE_URL=https://your-cdn.com/default-avatar.png

# File limits

MAX_UPLOAD_SIZE_MB=25
ALLOWED_FILE_TYPES=image/jpeg,image/png,video/mp4,video/quicktime

---

## Backend Structure

/server
/routes
upload.js -> handles image/video upload, returns file path + type
analyze.js -> sends image (or extracted video frames) to Claude vision, returns product description
script.js -> generates script JSON (hook, voiceover, captions, CTA) from description or custom user prompt
voice.js -> sends script text to ElevenLabs, returns audio file URL
avatar.js -> sends script + audio to D-ID, returns avatar talking-head video URL
compose.js -> ffmpeg job: overlays avatar bubble (bottom-left, ~20% width) onto original product video
/utils
extractFrames.js -> ffmpeg: pulls 3-5 still frames from uploaded video for vision analysis
claudeClient.js
elevenLabsClient.js
didClient.js
server.js

### API Flow (endpoint by endpoint)

1. POST /api/upload — multipart form upload, image or video. Returns { fileId, fileUrl, fileType }.
2. POST /api/analyze — body: { fileId, customPrompt? }. If video, extract frames first. Sends image(s) + prompt to Claude vision. Returns { productDescription, suggestedAngle }.
3. POST /api/script — body: { productDescription, tone, language, targetAudience? }. Returns structured JSON: { hookLine, voiceoverScript, onScreenCaption, shotList, callToAction }.
4. POST /api/voice — body: { voiceoverScript, voiceId? }. Calls ElevenLabs, returns { audioUrl }.
5. POST /api/avatar — body: { voiceoverScript, audioUrl }. Calls D-ID, returns { avatarVideoUrl }.
6. POST /api/compose — body: { originalFileId, avatarVideoUrl }. Runs ffmpeg to overlay avatar bubble bottom-left on top of the original product footage. Returns { finalVideoUrl }.

Each step should be callable independently (so the frontend can show progress: "Analyzing product... Writing script... Generating voice... Adding avatar... Finalizing video...").

---

## Frontend Structure

/src
/components
UploadZone.jsx -> drag-and-drop image/video upload
PromptOverride.jsx -> optional textarea for user's own prompt/instructions
ScriptPreview.jsx -> editable script output (hook, voiceover, CTA) before generating voice
ProgressStepper.jsx -> visual pipeline: Upload -> Analyze -> Script -> Voice -> Avatar -> Final
VideoPreview.jsx -> final video player, styled with the avatar-bubble-bottom-left mockup frame
LanguageToneSelect.jsx
/pages
Home.jsx
Generate.jsx
Result.jsx
App.jsx

---

## UI Direction (to avoid the generic "AI tool" look)

[9/1/2026 9:47 AM] Pisey: Most AI tool UIs default to: purple gradients, glassmorphism cards, Inter font, centered hero with a big glowing CTA button. Avoid all of that — it screams template.

Instead:

- Color palette: dark charcoal/indigo background (#14171F), warm saffron gold accent (#E8A33D), muted teal secondary (#4FB0A5) — grounded, editorial, not neon-tech
- Typography: pair a serif display font (Fraunces or similar) for headlines with a clean sans (Inter) for body — gives it a crafted, human feel instead of generic SaaS
- Layout: asymmetric, not centered-hero. Let the product photo/video preview dominate the left, controls and script text on the right, like a content editing tool, not a landing page
- Motion: subtle, no bouncy gradients. Simple fade/slide transitions between pipeline steps
- Copy tone: direct, local, no corporate AI-hype language ("Effortlessly create stunning content with the power of AI" — avoid this entirely). Write like you're talking to a shop owner, plain and useful.
- The signature visual: always show the mock video frame with a small circular avatar bubble bottom-left and the product large and centered — this should appear in the hero, in the preview, everywhere, it's the brand signature

---

## MVP Feature Scope (build in this order)

1. Image upload + Claude vision product analysis
2. Script generation (editable by user before continuing)
3. ElevenLabs voice generation from script
4. D-ID avatar video generation from voice
5. ffmpeg composition: overlay avatar bubble onto original product footage
6. Video upload support (extract frames, reuse image pipeline)
7. Language + tone selector (Khmer, English, Vietnamese to start)
8. Local payment integration (KHQR) — later, after demand validation

Do NOT build in v1: fine-tuned/custom models, mixed image+video uploads in one job, multi-avatar support, auto-posting to social platforms.

---

## Notes for Whoever Builds This

- Never expose API keys in frontend code — all third-party calls go through the Express backend
- Each pipeline step should fail gracefully and be retryable independently (don't force a full restart if only the voice step fails)
- Keep the free/demo tier limited (e.g., 1 watermarked low-res video) to avoid burning API costs at scale — do not offer unlimited free generation

---

## Hero / Marketing Visual (desk + monitor mockup)

For the landing page hero and any promo image, use a desk-and-monitor scene where the actual app screen is large and legible, not a decorative gadget shot. The screen is the content — everything around it (bezel, stand, desk edge) stays minimal so it doesn't compete for attention.

- Composition: dark scene, monitor fills most of the frame, screen content readable at a glance. Desk/keyboard only hinted at the bottom edge, not a full desk setup.
- What's on screen: the real app UI mid-pipeline — top nav with the step tracker (upload / analyze / script / voice / avatar / final, current step highlighted in gold), left panel showing the video preview with the avatar bubble bottom-left (the brand signature), right panel showing the script editor (hook line, voiceover text, "Generate voice" button).
- Palette stays the same as the rest of the UI: #14171F background, #E8A33D gold accent, #4FB0A5 teal secondary. No purple gradients, no glassmorphism, no glow/neon effects on the mockup itself.
- Purpose: this is what should render in the hero section, the "how it works" section, and any social/ad creative — the product screenshot is the hero image, not a separate illustration.
