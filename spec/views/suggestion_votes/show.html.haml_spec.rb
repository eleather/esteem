require 'spec_helper'

describe "suggestion_votes/show.html.haml" do
  before(:each) do
    @suggestion_vote = assign(:suggestion_vote, stub_model(SuggestionVote,
      :suggestion_id => 1,
      :user_id => 1,
      :vote => 1
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
