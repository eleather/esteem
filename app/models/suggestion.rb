class Suggestion < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  
  has_many :suggestion_votes
  
  def vote_score
    suggestion_votes.inject(0) do |s,v| 
      s += v.vote 
    end
  end
end
