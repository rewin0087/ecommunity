require 'rails_helper'

RSpec.describe StartController, :type => :controller do
	describe "GET #index" do
		it "responds successfully with an HTTP 200 status code" do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the index template" do
	      	get :index
	      	expect(response).to render_template("index")
	    end
	end

	describe "GET #events" do
		it "responds successfully with an HTTP 200 status code" do
			get :events
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the events template" do
	      	get :events
	      	expect(response).to render_template("events")
	    end
	end

	describe "GET #participants" do
		it "responds successfully with an HTTP 200 status code" do
			get :participants
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the participants template" do
	      	get :participants
	      	expect(response).to render_template("participants")
	    end
	end
end
