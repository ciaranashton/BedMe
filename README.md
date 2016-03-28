# Git commands

**First time setup**:

1. ``git config --global user.name "Your Name"`` (sets your username as a global variable)
2. ``git config --global user.email emailaddress@example.com`` (sets your email as a global variable)
3. ``git config --global push.default matching`` (sets the default push method)
4. ``git config --global alias.co checkout`` (using ``git co ...`` has the same effect as ``git checkout ...``)
5. ``git init`` (initialises git)

**Starting a session**:

- ``git pull`` (pulls in the current version of the branch you are working on)

**Uploading a session**:

1. ``git status`` (check which files have been edited)
2. ``git diff`` (check the individual lines of files which have been edited)
3. ``git add .`` (adds all local files to a pushable state)
4. ``git commit -m -a`` (-m: commit message, -a: performs previous command)
5. ``git push`` (shares to the repository (current branch)

**Changing branch**:

1. ``git checkout -b <branchname>`` (creates and opens new branch)
2. ``git checkout <branchname>`` (move to the branch)

**View branches**:

- ``git branch``
