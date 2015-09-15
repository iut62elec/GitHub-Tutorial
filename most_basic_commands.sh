#!/usr/bin/env 
# Author: Man Peng
# Sep 2015

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
cd markup #get in the folder for the repo you just downloaded
# extract all branches if they exist
for branch in `git branch -a | grep remotes | grep -v HEAD`; do
    git branch --track ${branch##*/} $branch
done
git fetch --all ; git pull --all

##################################################
### Always "git fetch origin the_main_branch" to 
### get the most updated codes if one wants to make
### changes to the source codes
##################################################

# check out the remotes you currently have, usually the default
# one is the "origin"
git remote -v
# create your own branch
git branch man-branch
git branch -a #check the list of branches you have
# switch to my own branch
git checkout man-branch
# After you changed your program codes and made commits
git push -u origin man-branch # push your changes to github
    # another way to push results is through github desktop software