class Event < ActiveRecord::Base
	belongs_to :user
	has_many :invitations
	validates :title, presence: true
	validates_datetime :from_time, presence: true
	validates_datetime :until_time, presence: true
end
