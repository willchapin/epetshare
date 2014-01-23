class User < ActiveRecord::Base

  attr_accessible :firstname, :lastname, :email, :paw_points

  before_save :hash_password
  
  validates_presence_of :firstname, :lastname, :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_uniqueness_of :email
  validates_length_of :firstname, maximum: 15
  validates_length_of :lastname, maximum: 15

  has_many :pets
  has_many :locations
  has_many :time_slots
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'recipient_id'
  
  has_one :location

  private

  def hash_password
    self.password_hash = "asldifuh5"
  end
end
