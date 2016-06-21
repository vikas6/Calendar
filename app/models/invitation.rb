class Invitation < ActiveRecord::Base
	belongs_to :user
	belongs_to :event
	has_one :invitee, :through => :events, :class_name => "User", :foreign_key => "user_id"
end
