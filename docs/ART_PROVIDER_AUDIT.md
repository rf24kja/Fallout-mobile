# RADZONE — Image provider audit and verification

**Snapshot date:** 2026-11-10. **Status:** NEEDS REVALIDATION ON WINDOWS. This document is not proof of a working image-generation API connection.

## Prior OpenCode findings (historic session, 2026-10-23)

- Python `openai` SDK 2.14.0 imported successfully but `OpenAI()` failed because `OPENAI_API_KEY` was not present in that process.
- `google.genai` was importable but `genai.Client()` failed because no Google API key was provided.
- The legacy `google.generativeai` package was installed and emitted a deprecation warning.
- `torch` reported `2.13.0+cpu`, with CUDA unavailable in the tested Python environment (not proof there is no discrete GPU).
- ComfyUI, Stable Diffusion, ArtCraft and a usable image MCP server were **not verified**.
- Several attempts used CMD syntax in Windows PowerShell 5.1: `2>nul`, `&&`, `||`. Those command failures are **shell errors**, not evidence that a generator is unavailable.
- A ChatGPT image generation has succeeded independently of OpenCode; ChatGPT subscriptions do not automatically grant API credentials to OpenCode.

## Required on-device audit

1. Find exact OpenCode configuration, authorized MCP servers, ArtCraft installation, local image providers and project scripts. Never print credentials or store secrets in Git.
2. Check whether the host GPU is usable with available image software (separately from Python Torch CPU wheel).
3. Check provider capabilities using current **official** documentation: image generation, image editing/reference input, dimensions/alpha support, local file output, rate limits, price and commercial use.
4. Determine whether current authorized credentials and billing privileges are sufficient. Do not buy credits or activate a paid service without approval.
5. Test a SINGLE approved provider with a capped-cost image operation; verify the actual written PNG with `tools/validate_art.py`.
6. Record the exact provider, model, date, command (secrets redacted), dimensions, artifact path, hash, cost if known, licensing, failure reason and recommended next action.
7. If none is usable, set `BLOCKED_PROVIDER`, do not fake generated art, and continue non-art game development.

## Windows PowerShell 5.1 reminders

Use `Test-Path`, `Get-Command -ErrorAction SilentlyContinue`, `Get-ChildItem -ErrorAction SilentlyContinue`, `$env:VAR`, and `if (...) { ... } else { ... }`. Do not paste Bash/CMD redirects and conditional operators indiscriminately.

## Output

Update this document with **tested** findings, not provider advertising. Do not commit credentials, copyrighted external assets, or machine-specific private paths.
