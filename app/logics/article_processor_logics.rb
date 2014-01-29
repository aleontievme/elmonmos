class ArticleProcessorLogics
  # Create or update article from definition by specified path
  def self.process(path)
    definition = Definition.new(File.read(path))
    article = Article.find_or_create_by(permalink: definition.tags["id"])
    article.title     = definition.tags["title"]
    article.content   = definition.content
    article.save
  end
end