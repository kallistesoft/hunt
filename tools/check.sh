#!/bin/sh
# Pre-push check (run by the global pre-push hook, or by hand): the same steps as the deploy workflow's build job,
# minus the web build, plus flutter analyze and the offline question-pipeline tests.
set -e
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

echo "== question pipeline tests (offline)"
PY="${HUNT_PY:-$ROOT/.venv/bin/python}"
if [ -x "$PY" ] && "$PY" -c "import pytest, pydantic" 2>/dev/null; then
  (cd tools && "$PY" -m pytest -q tests)
else
  echo "skipped: no .venv with pytest (python3.13 -m venv .venv && .venv/bin/pip install -r tools/requirements.txt pytest)"
fi

echo "== app"
# wildlife_id.py needs Python 3.10+; macOS python3 is 3.9, so use the .venv (or python3.13) when there is one.
if [ -x "$PY" ]; then export PYTHON="$PY"; elif command -v python3.13 >/dev/null; then export PYTHON=python3.13; fi
tools/sync_app_content.sh >/dev/null
cd app
flutter pub get >/dev/null
flutter analyze
flutter test
echo "check: all passed"
