### User Factories ###

Factory.define(:user) do |user|
  user.sequence(:email) { |n| "test#{n}@test.rapleaf.com" }
  user.password('secret')
  user.confirmed_at(1.day.ago)
end


### Organization Factories ###

Factory.define(:organization) do |organization|
  organization.sequence(:name) { |n| "Organization Name #{n}" }
  organization.sequence(:slug) { |n| "organization-slug-#{n}"}
  organization.sequence(:description) { |n| "Organization Description #{n}"}
end

Factory.define(:organization_with_projects, :parent => :organization) do |organization|
  organization.after_create do |o| 
    Factory(:project_with_questions_and_suggestions, :organization => o)
    Factory(:project_with_questions_and_suggestions, :organization => o)
  end
end


### Project Factories ###

Factory.define(:project) do |project|
  project.sequence(:name) { |n| "Project Name #{n}" }
  project.sequence(:slug) { |n| "project-slug-#{n}"}
  project.sequence(:description) { |n| "Project Description #{n}"}
  
  # Setup associations
  project.organization
end

Factory.define(:project_with_questions_and_suggestions, :parent => :project) do |project|
  project.after_create do |p|
    # Create projects
    Factory(:question_with_responses, :project => p)
    Factory(:question_with_responses, :project => p)
    
    # Create suggestions
    Factory(:suggestion, :project => p, :user => Factory(:user))
    Factory(:suggestion, :project => p, :user => Factory(:user))
  end
end


### Radial Factories ###

Factory.define(:radial) do |radial|
  radial.sequence(:name) { |n| "Radial Name #{n}" }
  radial.sequence(:description) { |n| "Radial Description #{n}"}
  
  # Setup associations
  radial.project
end


### Question Factories ###

Factory.define(:question) do |question|
  question.sequence(:title) { |n| "Question Title #{n}" }
  question.sequence(:description) { |n| "Question Description #{n}" }
  
  # Setup associations
  question.project
end

Factory.define(:question_with_responses, :parent => :question) do |question| 
  question.after_create do |q|
    Factory(:question_response, :question => q, :user => Factory(:user))
    Factory(:question_response, :question => q, :user => Factory(:user))
  end
end


### Question Response Factories ###

Factory.define(:question_response) do |question_response|
  question_response.response rand(4) + 1
  
  # Setup associations
  question_response.question
  question_response.user
end


### Suggestion Factories ###

Factory.define(:suggestion) do |suggestion|
  suggestion.sequence(:title) { |n| "Suggestion Title #{n}" }
  suggestion.sequence(:description) { |n| "Suggestion Description #{n}" }
  
  # Setup assocations
  suggestion.project
  suggestion.user
end


### Suggestion Vote Factories ###

# This factory can't be instantiated on it's own because it doesn't have a vote.
Factory.define(:suggestion_vote) do |suggestion_vote|
  # Setup associations
  suggestion_vote.suggestion
  suggestion_vote.user
end

Factory.define(:suggestion_vote_positive, :parent => :suggestion_vote) do |suggestion_vote|
  suggestion_vote.vote 1
end

Factory.define(:suggestion_vote_negative, :parent => :suggestion_vote) do |suggestion_vote|
  suggestion_vote.vote -1
  
  
end
