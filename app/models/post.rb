class Post < ActiveRecord::Base
	belongs_to :mygroup
	validates :content, presence: true 
end
