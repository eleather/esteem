require 'spec_helper'

describe Project do
  let :user do
    Factory(:user)
  end
  
  let :project do
    Factory(:project)
  end
  
  let :questions do
    project
    (1..6).map { Factory(:question, :project => project) }
  end
  
  let :question_responses do
    questions
    user
    questions.map do |question|
      Factory(:question_response, :question_id => question.id)
    end
  end
  
  describe '.get_unanswered_questions_for_user' do
    describe 'when project has no questions' do
      it 'should not error' do
        lambda { project.get_unanswered_questions_for_user(user) }.should_not raise_error
      end
      
      it 'should return an empty array' do
        project.get_unanswered_questions_for_user(user).should eq([])
      end
    end
    
    describe 'when user has answered no questions recently for this project' do
      it 'should return all questions for this project' do
        questions
        QuestionResponse.should_receive(:where).with(:user_id => user.id).and_return([])
        project.get_unanswered_questions_for_user(user).should eq(questions)
      end
    end
    
    describe 'when user has answered some questions recently for this project' do
      it 'should return only the questions the user hasn\'t answered recently' do
        questions
        QuestionResponse.should_receive(:where).with(:user_id => user.id).and_return(question_responses[0..1])
        project.get_unanswered_questions_for_user(user).should eq(questions[2..questions.size])
      end
    end
    
    describe 'when user has answered all questions recently for this project' do
      it 'should return an empty array' do
        questions
        QuestionResponse.should_receive(:where).with(:user_id => user.id).and_return(question_responses)
        project.get_unanswered_questions_for_user(user).should eq([])
      end
    end
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
