require 'spec_helper'

describe Radial do
  let :radial do
    Factory(:radial)
  end
  
  describe '.score' do
    describe 'when radial has no questions' do
      it 'should not error' do
        lambda { radial.score }.should_not raise_error
      end
      
      it 'should return 0.0' do
        radial.score.should eq(0.0)
      end
    end
    
    describe 'when radial has some questions' do
      it 'should return the average of the scores of its questions' do
        questions = (1..4).map { |i| Factory(:question) }
        
        radial.should_receive(:questions).exactly(3).times.and_return(questions)
        questions[0].should_receive(:score).and_return(1.0)
        questions[1].should_receive(:score).and_return(2.0)
        questions[2].should_receive(:score).and_return(4.0)
        questions[3].should_receive(:score).and_return(5.0)
        
        radial.score.should eq(3.0)
      end
    end
  end
end
