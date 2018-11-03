.PHONY: upload test autoformat clean

.venv:
	virtualenv --python=python3 .venv
	.venv/bin/pip install -U pip setuptools
	.venv/bin/pip install -e '.[development]'

autoformat: .venv
	.venv/bin/isort --recursive tinyprompt/ setup.py
	if [ -f .venv/bin/black ]; then .venv/bin/black tinyprompt/ setup.py; fi

test: .venv
	./test.sh

upload: .venv
	rm -rf dist/*
	.venv/bin/python setup.py sdist
	.venv/bin/twine upload dist/*

clean:
	rm -rf .venv dist build .tox
