require "spec_helper"

describe RadialsController do
  describe "routing" do

    it "routes to #index" do
      get("/radials").should route_to("radials#index")
    end

    it "routes to #new" do
      get("/radials/new").should route_to("radials#new")
    end

    it "routes to #show" do
      get("/radials/1").should route_to("radials#show", :id => "1")
    end

    it "routes to #edit" do
      get("/radials/1/edit").should route_to("radials#edit", :id => "1")
    end

    it "routes to #create" do
      post("/radials").should route_to("radials#create")
    end

    it "routes to #update" do
      put("/radials/1").should route_to("radials#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/radials/1").should route_to("radials#destroy", :id => "1")
    end

  end
end
