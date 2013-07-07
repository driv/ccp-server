require "spec_helper"

describe UsersController do
  describe "routing" do

    it "routes to #index" do
      get(users_path).should route_to("users#index")
    end

    it "routes to #show" do
      get(user_path(1)).should route_to("users#show", :id => "1")
    end

    it "routes to #create" do
      post(users_path).should route_to("users#create")
    end

    it "routes to #update" do
      put(user_path(1)).should route_to("users#update", :id => "1")
    end

    it "routes to #destroy" do
      delete(user_path(1)).should route_to("users#destroy", :id => "1")
    end


  end
end
