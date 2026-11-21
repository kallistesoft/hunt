# Decisions

Non-blocking choices Claude made with its default; owner validates later. When a choice isn't blocking, write it
here with the default taken and keep working; ask only when it blocks.

| Date | Decision | Default taken | Status |
|---|---|---|---|
| 2026-11-21 | Python for `tools/sync_app_content.sh` when there is no `.venv` | `$PYTHON` if set, else `python3`; `tools/check.sh` sets it to `python3.13` (macOS python3 is 3.9, too old for `wildlife_id.py`) | to validate |
