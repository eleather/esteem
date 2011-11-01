# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
  id: 1,
  email: "test@example.com",
  password: "test"
)


Organization.create(
  id: 1,
  name: "ExampleCo",
  slug: "exampleco",
  description: "This is the default example organization."
)


Project.create(
  id: 1,
  name: "Test",
  slug: "test",
  description: "This is the default test project.",
  organization_id: 1
)


1.upto(10) do |i|
  Question.create(
    id: i, 
    title: "Question #{i}", 
    description: "How do you feel about default question #{i}?",
    project_id: 1)
end


1.upto(6) do |i|
  Radial.create(
    id: i,
    name: "Radial #{i}",
    description: "This is radial #{i}.",
    project_id: 1
  )
end

# set up questions-radials associations
Question.find(1).radials = [Radial.find(1)]
Question.find(2).radials = [Radial.find(1)]
Question.find(3).radials = [Radial.find(2)]
Question.find(4).radials = [Radial.find(2)]
Question.find(5).radials = [Radial.find(3)]
Question.find(6).radials = [Radial.find(3)]
Question.find(7).radials = [Radial.find(4)]
Question.find(8).radials = [Radial.find(4)]
Question.find(9).radials = [Radial.find(5)]
Question.find(10).radials = [Radial.find(6)]

Radial.find(1).questions = [Question.find(1)]
Radial.find(2).questions = [Question.find(2), Question.find(7)]
Radial.find(3).questions = [Question.find(3)]
Radial.find(4).questions = [Question.find(4), Question.find(8)]
Radial.find(5).questions = [Question.find(5)]
Radial.find(6).questions = [Question.find(6), Question.find(9), Question.find(10)]


1.upto(10) do |i|
  QuestionResponse.create(
    id: i,
    question_id: i,
    user_id: 1,
    response: (1 + (i % 5))
  )
end


Suggestion.create(
  id: 1,
  title: "Suggestion",
  description: "This is an example suggestion.",
  project_id: 1,
  user_id: 1
)

SuggestionVote.create(
  id: 1,
  suggestion_id: 1,
  user_id: 1,
  vote: 1
)
