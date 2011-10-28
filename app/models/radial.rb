class Radial < ActiveRecord::Base
  belongs_to :project
  
  has_and_belongs_to_many :questions
  
  
  def score
    if questions.any?
      questions.inject(0.0) { |a,q| a += q.score } / questions.size
    else
      0.0
    end
  end
end
