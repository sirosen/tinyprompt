#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"

if [ -d .venv ]; then . .venv/bin/activate; fi
flake8
isort --recursive --check-only tinyprompt/ setup.py
if which black; then black --check  tinyprompt/ setup.py; fi
pytest -v --cov=tinyprompt
