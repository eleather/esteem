require 'spec_helper'

describe Question do
  let :question do
    Factory(:question)
  end
  
  describe '.score' do
    describe 'when question has no responses' do
      it 'should not error' do
        lambda { question.score }.should_not raise_error
      end
      
      it 'should return 0' do
        question.score.should eq(0.0)
      end
    end
    
    describe 'when question has some responses' do
      it 'should return the average of its responses' do
        question_responses = (1..5).map { |i| Factory(:question_response, :question => question, :response => i) }
        question.score.should eq(3.0)
      end
    end
  end
end
