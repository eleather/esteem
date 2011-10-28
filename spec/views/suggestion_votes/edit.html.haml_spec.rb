require 'spec_helper'

describe "suggestion_votes/edit.html.haml" do
  before(:each) do
    @suggestion_vote = assign(:suggestion_vote, stub_model(SuggestionVote,
      :suggestion_id => 1,
      :user_id => 1,
      :vote => 1
    ))
  end

  it "renders the edit suggestion_vote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => suggestion_votes_path(@suggestion_vote), :method => "post" do
      assert_select "input#suggestion_vote_suggestion_id", :name => "suggestion_vote[suggestion_id]"
      assert_select "input#suggestion_vote_user_id", :name => "suggestion_vote[user_id]"
      assert_select "input#suggestion_vote_vote", :name => "suggestion_vote[vote]"
    end
  end
end
