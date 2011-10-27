require 'spec_helper'

describe 'suggestions/index.html.haml' do
  before(:all) do
    # Create a Suggestion
    @suggestion = Factory(:suggestion)
  end
  
  before(:each) do
    visit suggestions_path
  end

  it 'renders a list of suggestions' do
    page.should have_content(@suggestion.title)
    page.should have_content(@suggestion.description)
    page.should have_link(@suggestion.project.name, :href => project_path(@suggestion.project))
    
    # Make sure we're keeping suggestions anonymous.
    page.should_not have_content(@suggestion.user.email)
    
  end
end