# Repository logics
class RepositoryLogics
  # Fetches all the changes of the git repository by specified path
  def self.update(git_path)
    git = Git.open(git_path)
    git.checkout
    git.fetch
    git.merge('origin/master')

    true # everything is ok.
  end
end