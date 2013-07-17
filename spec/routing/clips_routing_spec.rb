require "spec_helper"

describe ClipsController do

    describe "routing" do

      it "routes to #index" do
        get(user_clips_path(1)).should route_to("clips#index", user_id: "1")
      end

      it "routes to #show" do
      	get(user_clip_path(1,2)).should route_to("clips#show", user_id: "1", id: "2")
      end

      it "routes to #create" do
      	post(user_clips_path(1)).should route_to("clips#create", user_id: "1")
      end

      it "routes to #destroy" do
      	delete(user_clip_path(1,2)).should route_to("clips#destroy", user_id: "1", id: "2")
      end

      it "should not route to #update" do
      	put(user_clip_path(1,2)).should_not route_to("clips#update", user_id: "1", id: "2")
      end

    end
end