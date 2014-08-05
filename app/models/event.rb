class Event < ActiveRecord::Base
	validates :name, :date_time, :venue, presence: true

	validates_associated  :participant

	has_many :participant
end
