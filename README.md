# Git Smart Checkout

This is a dumb little library I made because I don't like using autocomplete to delete a branch.

This will run `git remote prune origin` and then prompt the user to confirm deleting all the branches that have been merged into the current `git branch --merged`.

By default, `master` and `develop` branches will be exempt.

## Setup

To call this library from the command line, you have to make the ruby file available in your $PATH.

You'll want to clone this repo somewhere, then symlink the `git_smart_clone.rb` file somewhere on your $PATH. EG:

```
chmod +x git_smart_clone.rb
ln -s `pwd`/git_smart_clone.rb ~/bin/git_smart_clone
```

You can also add an alias to make using this more convenient. EG:

```
alias gsp="git_smart_prune"
```
