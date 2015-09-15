#!/usr/bin/env 

# first set up git info
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
# check git config info
git config --list

# create a git repo
git init

# make change to codes and commit LOCALLY
git add dummy1.py *.py dummy_folder/*.txt
git add --all #adding all files
git commit -m 'my change to some codes'

# clone a git on GitHub
git clone https://github.com/ng-manpeng/markup.git
