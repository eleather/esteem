class Project < ActiveRecord::Base
  belongs_to :organization
  has_many :suggestions
end
