# Makefile for controlling python virtual environments etc
.PHONY: clean clean-test clean-pyc help
.DEFAULT_GOAL := help

# See https://github.com/sio/Makefile.venv
include Makefile.venv

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT

help:
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

default: venv show-venv ## set up the virtual environment
	@echo to activate the virtual environment in a shell
	@echo source .venv/bin/activate
	@echo or type make bash

# various python utilities can be run (and auto-installed at need by developers without needing to
# be in the requirements file) like so:

lint: $(VENV)/flake8 ## check style with flake8
	$(VENV)/flake8 --exclude .git,__pycache__,.venv,venv

test: $(VENV)/pytest ## run all tests with pytest
	$(VENV)/pytest

# pipreqs: $(VENV)/pipreqs
# 	$(VENV)/pipreqs --force --ignore .venv . 

clean: clean-pyc clean-test ## remove all build, test, coverage and Python artifacts

clean-pyc: ## remove Python file artifacts
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

clean-test: ## remove test and coverage artifacts
	rm -fr .tox/
	rm -f .coverage
	rm -fr htmlcov/
	rm -fr .pytest_cache

reallyclean:clean clean-venv ## clean all python artifacts and delete .venv
