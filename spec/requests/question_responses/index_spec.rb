require 'spec_helper'

describe 'question_responses/index.html.haml' do
  before(:all) do
    # Create a Suggestion
    @question_response = Factory(:question_response)
  end
  
  before(:each) do
    visit question_responses_path
  end

  it 'renders a list of question_responses' do
    page.should have_content(@question_response.response)
    page.should have_link(@question_response.question.title, :href => question_path(@question_response.question))
    
    # Make sure we're keeping responses anonymous.
    page.should_not have_content(@question_response.user.email)
  end
end
