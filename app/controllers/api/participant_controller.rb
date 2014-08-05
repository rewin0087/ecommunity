module Api
	class Api::ParticipantController < ApplicationController

		def index
			render :json => Participant.includes(:event).as_json(include: :event)
		end
  
		def create
			# initialize participant model
			participant = Participant.new({ 
				full_name: params[:full_name], 
				email: params[:email], 
				mobile: params[:mobile], 
				event_id: params[:event_id]
			})
			# check data validity
			if participant.valid?
				# save
				participant.save()
				# return record
				render :json => Event.find(participant.event_id)
			else
				# return error
				render :json => { error: participant.errors }, :status => 503
			end

		end

	end
end