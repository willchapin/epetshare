class Location < ActiveRecord::Base

  belongs_to :user

  attr_accessible :user, :address, :city, :state, :zip

  validates_presence_of :user, :address, :city, :state, :zip
  validates_length_of :address, maximum: 50
  validates_length_of :city, maximum: 40
  validates_length_of :state, maximum: 12
  validates_length_of :zip, is: 5
  
end
