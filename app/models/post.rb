class Post < ApplicationRecord
	belongs_to :user
	attachment :post
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
  	has_many :likes
  	has_many :liked_users, through: :likes, source: :user
end