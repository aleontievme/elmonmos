# Content definition. Basic content container with tags
class Definition
  attr_reader :tags
  attr_reader :content

  def initialize(definition)
    @tags = {}

    delimiter_pos = (/\r?\n\r?\n/ =~ definition) #definition.index("\r\n\r\n")
    metadata = definition[0..delimiter_pos]
    content  = definition[delimiter_pos..-1]

    # process the definition
    process_metadata(metadata)
    process_content(content)
  end

  private

  def process_metadata(metadata)
    tags = metadata.split(/\r?\n/)
    tags.each{ |tag| process_metadata_tag(tag) }
  end

  def process_metadata_tag(tag)
    delimiter_pos = tag.index(":")
    tag_name  = tag[0..delimiter_pos-1].strip
    tag_value = tag[delimiter_pos+1..-1].strip
    process_tag(tag_name, tag_value)
  end

  def process_content(text)
    @content = GitHub::Markup.render("test.md", text)
  end

  def process_tag(tag, value)
    @tags[tag] = value
  end
end