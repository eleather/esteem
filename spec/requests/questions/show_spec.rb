require 'spec_helper'

describe "questions/show.html.haml" do
  before(:all) do
    # Create a Question
    @question = Factory(:question)
  end
  
  before(:each) do
    visit question_path(@question)
  end
  
  it 'should render the correct record attributes' do
    page.should have_content(@question.title)
    page.should have_content(@question.description)
    page.should have_link(@question.project.name, :href => project_path(@question.project))
  end
end
