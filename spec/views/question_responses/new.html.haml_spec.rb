require 'spec_helper'

describe "question_responses/new.html.haml" do
  before(:each) do
    assign(:question_response, stub_model(QuestionResponse,
      :question_id => 1,
      :user_id => 1,
      :response => 1
    ).as_new_record)
  end

  it "renders new question_response form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => question_responses_path, :method => "post" do
      assert_select "input#question_response_question_id", :name => "question_response[question_id]"
      assert_select "input#question_response_user_id", :name => "question_response[user_id]"
      assert_select "input#question_response_response", :name => "question_response[response]"
    end
  end
end
