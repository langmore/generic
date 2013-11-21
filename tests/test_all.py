import unittest
from StringIO import StringIO
import sys
from numpy.testing import assert_allclose
from datetime import datetime
import copy

"""
To run, from the tests/ directory, type:
$ python -m unittest test_all

OR for verbose output
$ python -m unittest -v test_all

OR to run only the methods in TestFilter
$ python -m unittest test_utils.TestFilter

OR to run only the TestFilter.test_generic_filter method
$ python -m unittest test_utils.TestFilter.test_generic_filter
"""


class TestNothing(unittest.TestCase):
    """
    Tests the implementation (but not the interface) of generic_filter.py
    """
    def setUp(self):
        self.outfile = StringIO()

    def test_nothing(self):
        pass

    def tearDown(self):
        self.outfile.close()
