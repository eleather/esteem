class Project < ActiveRecord::Base
  belongs_to :organization
  
  has_many :radials
  has_many :questions
  has_many :suggestions
  
  def suggestions_ordered_by_vote_score
    suggestions.sort_by { |s| s.vote_score }.reverse
  end
end
