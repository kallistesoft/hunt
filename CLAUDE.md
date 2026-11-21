# BetterHunter (repo `kallistesoft/hunt`, local folder HuntExamPrep)

FR/EN hunting app: exam practice (PAL/CFSC, Québec ICAF, CRFSC, Alberta…), game ID photo quiz, rules. Free with ads.
This repo holds the content, the question pipeline and the Flutter app whose web build is the demo at
https://hunt.kallistesoft.ca. The native store apps live in `betterHunter-android` / `betterHunter-ios`.

## Stack
- `app/`: Flutter (iOS, Android, web). `content/`: exams, questions, glossary, wildlife-id cards (JSON).
- `tools/qgen`: Python question pipeline, venv `.venv` on Python 3.13 (macOS `python3` is 3.9, too old).
- `tools/wildlife_id.py`: photo ID bank (Wikimedia Commons free-licence photos, credit shown in the app).

## Build, check, deploy
- Check: `tools/check.sh` (pipeline tests, content sync, `flutter analyze`, `flutter test`). The global pre-push hook runs it.
- Web demo locally: `tools/sync_app_content.sh`, then `flutter build web` in `app/`, serve `app/build/web`;
  screenshots with puppeteer-core installed in the scratchpad (never in the repo), 412×880 viewport.
- Deploy: every push to `main` builds the web app and uploads it to GoDaddy (`deploy-godaddy.yml`). Branches don't deploy.

## Content rules (owner)
- Official manuals are copyrighted: `sources/` stays gitignored, questions use original wording.
- Every answer shows why, with the official source link (`sourceUrl`, manual `#page=N`). Keep that for new questions.
- The disclaimer (app home, README, site card) says: not affiliated, unofficial questions, errors possible.
- Brand is BetterHunter («Chassez mieux.» / "Hunt better."). No PPA/PAL or "exam prep" in the name; French UI says PPA, never PAL.
- Photo quiz distractors always come from the same family (bird → only birds, deer → only deer-like).
- Alberta facts change yearly: re-download the guide each July. Exam formats in `exams.json` are unverified.

## Branches and PRs
- Feature branch → push → PR against `main` (never stacked). The owner merges; never `gh pr merge`, never `--admin`.
- A push to `main` deploys, so nothing reaches `main` outside a PR the owner merged.

## Autonomy, to-dos, decisions
- Build and fix freely on a branch; ask before changing product choices above or the store identity.
- No to-do file yet: open items go in `FOLLOW-UP.md` (create it when needed).
- Non-blocking choices: write them in `DECISIONS.md` with the default taken, keep working.
