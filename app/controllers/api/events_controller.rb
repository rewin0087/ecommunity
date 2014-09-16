module Api
  class Api::EventsController < ApplicationController

    def index
      # return all events
      render :json => Event.all
    end
  
    def create
      # initialize event model
      event = Event.new({ name: params[:name], venue: params[:venue], date_time: params[:date_time] })
      # check data validity
      if event.valid?
        # save
        event.save()
        # return record
        render :json => event
      else
        # return error
        render :json => { error: event.errors }, :status => 503
      end
      
    end

    def destroy
      # get id
      id = params[:id]
      # find record
      event = Event.find(id)
      # destroy it now
      event.destroy()
      # return destroyed record
      render :json => event
    end
  end
end