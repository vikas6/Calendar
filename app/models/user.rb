class User < ActiveRecord::Base
	has_many :events
	has_one :user_profile
	has_many :invitations
end
