class User < ActiveRecord::Base
	has_many :clips
	has_many :subscriptions

	validates :username, :password, presence: true
end
