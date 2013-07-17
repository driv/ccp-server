require 'spec_helper'

describe SessionsController do
	describe 'routing' do
		it "routes to #create" do
      		post(sessions_path).should route_to("sessions#create")
    	end
	end
end