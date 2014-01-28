class Message < ActiveRecord::Base

  attr_accessible :content, :title, :recipient

  # belong_to :user and and not sender!
  
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
  
  validates_presence_of :content, :title, :sender, :recipient
  
  validates_length_of :title, maximum: 100
  validates_length_of :content, maximum: 2500
  validate :sender_is_not_recipient
  
  private

  def sender_is_not_recipient
    errors.add(:recipient, "can't be sender") if sender == recipient
  end  
end
