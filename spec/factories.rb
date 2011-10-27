### User Factories ###

Factory.define(:user) do |user|
  user.sequence(:email) { |n| "test#{n}@test.rapleaf.com" }
  user.password('secret')
  user.confirmed_at(1.day.ago)
end


### Project Factories ###

Factory.define(:project) do |project|
  project.sequence(:name) { |n| "Project Name #{n}" }
  project.sequence(:slug) { |n| "project-slug-#{n}"}
  project.sequence(:description) { |n| "Project Description #{n}"}
end


### Organization Factories ###

Factory.define(:organization) do |organization|
  organization.sequence(:name) { |n| "Organization Name #{n}" }
  organization.sequence(:slug) { |n| "organization-slug-#{n}"}
  organization.sequence(:description) { |n| "Organization Description #{n}"}
end

Factory.define(:organization_with_projects, :parent => :organization) do |organization|
  organization.after_create do |o| 
    Factory(:project, :organization => o)
    Factory(:project, :organization => o)
  end
end
