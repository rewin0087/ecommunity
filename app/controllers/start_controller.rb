class StartController < ApplicationController
  def index
  end

  def events
  end

  def participants
  end

  def registered
  	id = params[:id]

  	if Participant.exists? id
  		@participant = Participant.includes(:event).find(id)
  	else
  		render :text => 'No Record Found.'
  	end
  end
end
