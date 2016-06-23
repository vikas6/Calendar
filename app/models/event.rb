class Event < ActiveRecord::Base
	belongs_to :user
	has_many :invitations
	validates :title, presence: true
end
