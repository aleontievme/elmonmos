class Article < ActiveRecord::Base
  has_many :article_tags
  has_many :tags, :through => :article_tags

  def self.tagged_by(tag_list)
    Article.joins{tags}.where{(tags.name.in tag_list)}.group{articles.id}.having{{articles => {count(id) => tag_list.size}}}.all
  end
end
