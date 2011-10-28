require 'spec_helper'

describe Project do
  let :project do
    Factory(:project)
  end
  
  describe '.suggestions_ordered_by_vote_score' do
    describe 'when Project has no Suggestions' do
      it 'should not error' do
        lambda { project.suggestions_ordered_by_vote_score }.should_not raise_error
      end
      
      it 'should return an empty array' do
        project.suggestions_ordered_by_vote_score.should eq([])
      end
    end
    
    describe 'when Project has some Suggestions' do
      it 'should return an array of Suggestions, in order from most positive vote_score to most negative vote_score' do
        suggestions = (1..5).map { Factory(:suggestion, :project => project) }
        suggestions[0].should_receive(:vote_score).and_return(1)
        suggestions[1].should_receive(:vote_score).and_return(3)
        suggestions[2].should_receive(:vote_score).and_return(5)
        suggestions[3].should_receive(:vote_score).and_return(-2)
        suggestions[4].should_receive(:vote_score).and_return(-4)
        project.should_receive(:suggestions).and_return(suggestions)
        project.suggestions_ordered_by_vote_score.should eq([suggestions[2], suggestions[1], suggestions[0], suggestions[3], suggestions[4]])
      end
    end
  end
end
