class Suggestion < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  
  has_many :suggestion_votes
end
