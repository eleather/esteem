require "spec_helper"

describe SuggestionVotesController do
  describe "routing" do

    it "routes to #index" do
      get("/suggestion_votes").should route_to("suggestion_votes#index")
    end

    it "routes to #new" do
      get("/suggestion_votes/new").should route_to("suggestion_votes#new")
    end

    it "routes to #show" do
      get("/suggestion_votes/1").should route_to("suggestion_votes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/suggestion_votes/1/edit").should route_to("suggestion_votes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/suggestion_votes").should route_to("suggestion_votes#create")
    end

    it "routes to #update" do
      put("/suggestion_votes/1").should route_to("suggestion_votes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/suggestion_votes/1").should route_to("suggestion_votes#destroy", :id => "1")
    end

  end
end
