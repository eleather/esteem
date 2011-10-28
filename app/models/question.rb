class Question < ActiveRecord::Base
  belongs_to :project
  
  has_many :question_responses
  
  has_and_belongs_to_many :radials
end
