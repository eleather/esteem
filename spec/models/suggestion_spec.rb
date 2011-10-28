require 'spec_helper'

describe Suggestion do
  describe '.vote_score' do    
    describe 'when Suggestion has no SuggestionVotes' do
      before(:all) do
        @suggestion = Factory(:suggestion)
      end
    
      it 'should not error' do
        lambda { @suggestion.vote_score }.should_not raise_error
      end
    
      it 'should return 0' do
        @suggestion.vote_score.should eq(0)
      end
    end
    
    it 'should return the sum of all the SuggestionVotes belonging to this Suggestion' do
      suggestion = Factory(:suggestion)
      votes = []
      votes += (1..4).map { Factory(:suggestion_vote_positive, :suggestion => suggestion) }
      votes += (1..3).map { Factory(:suggestion_vote_negative, :suggestion => suggestion) }
      suggestion.vote_score.should eq(1)
    end
  end
end
