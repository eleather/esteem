require 'spec_helper'

describe "question_responses/show.html.haml" do
  before(:each) do
    @question_response = assign(:question_response, stub_model(QuestionResponse,
      :question_id => 1,
      :user_id => 1,
      :response => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
