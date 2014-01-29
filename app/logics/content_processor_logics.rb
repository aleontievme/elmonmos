class ContentProcessorLogics
  # Process all the content by specified path
  def self.process(path)
    files = Dir.glob(path + "/*")
    files.each do |file|
      ext = File.extname(file)
      ArticleProcessorLogics.process(file) if ext == ".article"
    end

    true
  end
end