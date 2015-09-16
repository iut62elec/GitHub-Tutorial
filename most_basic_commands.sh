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
# check the current status, such as uncommitted changes, failures, etc.
git status

# Revert changes after the files are even staged (after git add steps)
    # so that you may keep the files what they were before any of your
    # current modificaitons
git reset --hard  # Revert changes to modified files.
git clean -fd  # Remove all untracked files and directories.

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
# merge the branch named "man-branch" into the current branch "master"
    # here, we assume your current branch is "master"
git merge man-branch
# after you changed your program codes and made commits
git push -u origin man-branch # push your changes to github

"""
Another way to push results is through github desktop software

If you are a collaborator who wants to make contribuiton to the 
    main branch through GitHub, you may
    1) fork the original branch into your own branch in your GitHub account
    2) after you make changes to your forked branch, you may send a pull 
        request for your branch (the base) to be merged into original
        main branch (the HEAD)
"""

################################################################
### Input from Yoon about the public key assess on EC2 Instance
### Create public key to access github (https://help.github.com/articles/generating-ssh-keys/)
### You’ll need this when you get github access denied due to 
### missing public key
##################################################

ssh-keygen -t rsa -b 4096 -C 'myemail@email.com'
ssh-agent -s
ssh-add ~/.ssh/id_rsa # Add public key to github account (<>/github.com/settings/ssh)
ssh –vT git@github.com # Check for connection