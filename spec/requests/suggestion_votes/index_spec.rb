require 'spec_helper'

describe 'suggestion_votes/index.html.haml' do
  before(:all) do
    # Create a SuggestionVote
    @suggestion_vote = Factory(:suggestion_vote)
  end
  
  before(:each) do
    visit suggestion_votes_path
    save_and_open_page
  end

  it 'renders a list of suggestion_votes' do
    page.should have_content(@suggestion_vote.vote)
    page.should have_link(@suggestion_vote.suggestion.title, :href => suggestion_path(@suggestion_vote.suggestion))
    
    # Make sure we're keeping responses anonymous.
    page.should_not have_content(@suggestion_vote.user.email)
  end
end
