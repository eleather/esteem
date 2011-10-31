class Project < ActiveRecord::Base
  belongs_to :organization
  
  has_many :radials
  has_many :questions
  has_many :suggestions
  
  
  # Get an array of the questions that this user has not recently answered for
  # this project.
  def get_unanswered_questions_for_user(user)
    raise 'user is nil' if user.nil?
    
    # Get questions the user has answered.
    user_answered_questions = QuestionResponse.where(:user_id => user.id).map(&:question)
    
    # Subtract those from the full set of questions to get the set of any that
    # have not been answered.
    questions - user_answered_questions
  end
  
  def suggestions_ordered_by_vote_score
    suggestions.sort_by { |s| s.vote_score }.reverse
  end
end
