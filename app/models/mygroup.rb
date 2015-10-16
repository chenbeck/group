class Mygroup < ActiveRecord::Base
	validate :title, presence: true
end
