require 'bcrypt'

class User < ActiveRecord::Base
	include BCrypt

	has_many :posts
	has_many :likes
	has_many :reposts
	has_many :follows

	def password
		@password ||= Password.new(password_digest)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_digest = @password
	end
end
