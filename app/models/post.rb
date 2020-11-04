class Post < ApplicationRecord
	belongs_to :user
	attachment :post
	validates :title, presence: true
	validates :introduction, presence: true, length: {maximum: 200}
  	has_many :likes
  	has_many :liked_users, through: :likes, source: :user
  	has_many :tags, through: :post_tags
  	has_many :post_tags, dependent: :destroy

  	def save_categories(tags)
	    current_tags = self.categories.pluck(:name) unless self.categories.nil?
	    old_tags = current_tags - tags
	    new_tags = tags - current_tags
	    # Destroy old taggings:
	    old_tags.each do |old_name|
	      self.posts.delete Tag.find_by(name:old_name)
	    end
	    # Create new taggings:
	    new_tags.each do |new_name|
	      post_tag = Tag.find_or_create_by(name:new_name)
	      self.tags << post_tag
	    end
	end
end