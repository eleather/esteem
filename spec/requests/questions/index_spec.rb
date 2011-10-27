require 'spec_helper'

describe 'questions/index.html.haml' do  
  before(:each) do
    visit questions_path
  end

  describe 'when some questions exist' do
    before(:all) do
      # Create a Question
      @project = Factory(:project_with_questions_and_suggestions)
      @question = @project.questions.first
    end
    
    it 'renders a list of questions' do
      page.should have_content(@question.title)
      page.should have_link(@project.name, :href => project_path(@project))
      
      # Don't display the question description on this page - it's likely to be 
      # too wordy.
      page.should_not have_content(@question.description)
    end
  end
end
