class TimeSlot < ActiveRecord::Base

  belongs_to :user

  attr_accessible :start_time, :end_time, :time_type

  validates_presence_of :user, :start_time, :end_time, :time_type

  validate :no_overlap, if: "start_time && end_time && user"
  validate :start_before_end, if: "start_time && end_time"

  private

  def start_before_end
    errors.add(:start_time, "sad sad tears on my sad face") if start_time < end_time
  end

  # add index on user/time_type
  def no_overlap
    self.class.where(user_id: user.id, time_type: time_type).each do |other_time|
      errors.add(:start_time, "i'm a sad error") if overlaps?(other_time)
    end
  end
  
  def overlaps?(other_time)
    start_time <= other_time.end_time && end_time >= other_time.start_time
  end
end
