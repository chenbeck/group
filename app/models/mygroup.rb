class Mygroup < ActiveRecord::Base
	validates :title, presence: true
	has_many :posts
end
