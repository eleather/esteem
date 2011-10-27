require 'spec_helper'

describe 'suggestions/show.html.haml' do
  before(:all) do
    # Create a Suggestion
    @project = Factory(:project_with_questions_and_suggestions)
    @suggestion = @project.suggestions.first
  end
  
  before(:each) do
    visit suggestion_path(@suggestion)
  end

  it 'should render the correct record attributes' do
    page.should have_content(@suggestion.title)
    page.should have_content(@suggestion.description)
    page.should have_link(@project.name, :href => project_path(@project))
    
    # Make sure we're not displaying the user.
    page.should_not have_link(@suggestion.user.email)
  end
end
