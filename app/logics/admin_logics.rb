class AdminLogics
  # Updates all the content form the path specified
  def self.update(path)
    RepositoryLogics.update(path)
    ContentProcessorLogics.process(path)
  end
end
