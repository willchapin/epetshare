class Pet < ActiveRecord::Base
  
  belongs_to :user

  attr_accessible :name, :user, :species, :food_preferences, :is_social

  validates_presence_of :name, :user, :species
  validates_uniqueness_of :name, scoped: :user_id
  validates_length_of :name, maximum: 30

  validates :species, inclusion: { in: %w(cat dog),
    message: "%{value} is not a valid species" }
end
