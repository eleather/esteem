class Project < ActiveRecord::Base
  belongs_to :organization
  
  has_many :radials
  has_many :questions
  has_many :suggestions
end
