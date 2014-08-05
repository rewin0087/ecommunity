class Participant < ActiveRecord::Base
	validates :full_name, :email, :mobile, presence: true
	
	validates_presence_of :event_id, message: 'Please select one Course'

	validates :email, uniqueness: true

  	belongs_to :event
end
