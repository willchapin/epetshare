class TimeSlot < ActiveRecord::Base

  belongs_to :user

  attr_accessible :user, :start_time, :end_time, :time_type

  validates_presence_of :user, :start_time, :end_time, :time_type

  private

  def range
  end


end
