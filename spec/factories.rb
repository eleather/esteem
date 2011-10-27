Factory.define(:user) do |f|
  f.sequence(:email) { |n| "test#{n}@test.rapleaf.com" }
  f.password('secret')
  f.confirmed_at(1.day.ago)
end
