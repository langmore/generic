# simple makefile to simplify repetetive build env management tasks under posix

# caution: testing won't work on windows, see README

PACKAGE=generic # You should change this

PYTHON ?= python
UNITTEST ?= unittest
CTAGS ?= ctags

TESTDIR=$(PACKAGE)/tests

all: install test


# First install with pip
install: clean
	$(PYTHON) setup.py sdist
	pip install dist/*

# Reinstall with pip
reinstall: clean
	pip uninstall $(PACKAGE)
	$(PYTHON) setup.py sdist
	pip install dist/*

clean-ctags:
	rm -f tags

clean: clean-ctags
	$(PYTHON) setup.py clean --all
	rm -rf dist

tests: test  # Common misname...

test:
	$(PYTHON) -m $(UNITTEST) discover -s $(TESTDIR) -v

# To run tests contained in test_text.py
#test-text:
#	$(PYTHON) -m $(UNITTEST) discover -s $(TESTDIR) -p '*text*' -v

trailing-spaces:
	find $(PACKAGE) -name "*.py" | xargs perl -pi -e 's/[ \t]*$$//'

ctags:
	# make tags for symbol based navigation in emacs and vim
	# Install with: sudo apt-get install exuberant-ctags
	$(CTAGS) -R *

code-analysis:
	flake8 $(PACKAGE) | grep -v __init__ | grep -v external
	pylint -E -i y $(PACKAGE)/ -d E1103,E0611,E1101

