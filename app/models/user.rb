require 'bcrypt'

class User < ActiveRecord::Base
	include BCrypt

	validates :username, presence: true
	validates :username, uniqueness: true
	validates :display_name, presence: true
	validates :email, presence: true
	validates :email, uniqueness: true
	validates :username, format: { with: /[a-zA-Z0-9_]+/, message: "Only allows letters, numbers, and underscores" }

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
