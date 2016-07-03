class BranchDeletionPrompt

  RESERVED_BRANCHES = ["develop", "master"]

  attr_reader :branches

  def initialize(branches)
    @branches = branches
  end

  def prompt_to_delete_merged_branches
    deleteable_branches = branches - RESERVED_BRANCHES
    if deleteable_branches.any?
      if (ok_to_delete = prompt_to_delete_branches(deleteable_branches))
        delete_branches(deleteable_branches)
      end
    else
      puts "There are no merged branches to delete."
    end
  end

private

  def prompt_to_delete_branches(deleteable_branches)
    puts "The following branches have been merged into your current branch and can be deleted:"
    puts
    deleteable_branches.each do |branch_name|
      puts "  #{branch_name}"
    end
    puts
    # Use print rather than puts so that the number the user types show on the same line
    print "Type 'y' to delete these branches, or anything else to cancel: "
    gets.strip == "y"
  end

  def delete_branches(deleteable_branches)
    deleteable_branches.each do |branch_name|
      command = "git branch -d #{branch_name}"
      puts "Running '#{command}'"
      `#{command}`
    end
  end

end
