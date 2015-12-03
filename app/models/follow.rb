class Follow < ActiveRecord::Base
	belongs_to :user
	has_one :following, :class_name => 'User'
end
