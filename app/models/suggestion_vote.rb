class SuggestionVote < ActiveRecord::Base
  belongs_to :suggestion
  belongs_to :user
end
