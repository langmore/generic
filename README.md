Generic
=======
Contains code for generic repos.  To use:

* Clone this repo
* Change the name `generic` and `generic/generic/` to what you want your new repo/package to be called.  
* Change `generic` to the appropriate name in the makefile.  You can now install with `make`.
* Erase the `.git` folder in the directory using `rm -rf .git`
* cd into the directory and type `git init`, then `git add .`
* Commit the changes
* Make a new repo on github
* From command line
    
    git remote add origin https://github.com/jrl-labs/new-repo-name.git
    git push -u origin master

Style Guide
-----------

Non experts should follow the [LowClass Python style-guide](http://columbia-applied-data-science.github.io/pages/lowclass-python-style-guide.html)

Dependencies
------------

Data
----
* Choose your own data location
* Don't commit data to the repo

Read README_data.md for a more advanced scheme.

Directories
-----------

### notebooks
For ipython notebooks.  Put your name in the notebook name to avoid redundancy.

### schema
Schema for the data sets

### tests
Unit and integration tests.

### scripts
Shell scripts, python scripts, etc...


Server
======

To add packages using Chef
--------------------------

    open up /opt/chef/jrl/site-cookbooks/XXX/recipes/default.rb
    with any editor
    and add the packages you want
    the script runs on a 10min chron
    you can also just run it
    sudo chef-solo -c /opt/chef/jrl/solo.rb

