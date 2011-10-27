require "spec_helper"

describe QuestionResponsesController do
  describe "routing" do

    it "routes to #index" do
      get("/question_responses").should route_to("question_responses#index")
    end

    it "routes to #new" do
      get("/question_responses/new").should route_to("question_responses#new")
    end

    it "routes to #show" do
      get("/question_responses/1").should route_to("question_responses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/question_responses/1/edit").should route_to("question_responses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/question_responses").should route_to("question_responses#create")
    end

    it "routes to #update" do
      put("/question_responses/1").should route_to("question_responses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/question_responses/1").should route_to("question_responses#destroy", :id => "1")
    end

  end
end
