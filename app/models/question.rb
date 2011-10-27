class Question < ActiveRecord::Base
  belongs_to :project
  
  has_many :question_responses
end
