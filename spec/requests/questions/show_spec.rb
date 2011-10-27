require 'spec_helper'

describe "questions/show.html.haml" do
  before(:all) do
    # Create a Question
    @project = Factory(:project_with_questions_and_suggestions)
    @question = @project.questions.first
  end
  
  before(:each) do
    visit question_path(@question)
  end
  
  it 'should render the correct record attributes' do
    page.should have_content(@question.title)
    page.should have_content(@question.description)
    page.should have_link(@project.name, :href => project_path(@project))
  end
end
