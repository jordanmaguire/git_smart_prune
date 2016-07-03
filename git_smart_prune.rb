#!/usr/bin/env ruby

require_relative "lib/branch_parser"
require_relative "lib/branch_deletion_prompt"

# Run `git remote prune origin` first to delete any remote references to the
# branches we have checked out locally that have already been deleted
command = "git remote prune origin"
puts "Running #{command}"
`#{command}`

# Prompt the user to delete any of the branches that are merged into the
# current branch
branches = BranchParser.new(`git branch --merged`).branches
BranchDeletionPrompt.new(branches).prompt_to_delete_merged_branches
