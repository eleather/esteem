class Question < ActiveRecord::Base
  belongs_to :project
  
  has_many :question_responses
  
  has_and_belongs_to_many :radials
  
  
  def score
    if question_responses.any?
      question_responses.inject(0.0) { |a,r| a += r.response } / question_responses.size
    else
      0.0
    end
  end
end
