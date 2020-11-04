class Tag < ApplicationRecord
	validates :name,presence:true,length:{maximum:50}
  	has_many :posts, through: :post_tags
    has_many :post_tags, dependent: :destroy
end
