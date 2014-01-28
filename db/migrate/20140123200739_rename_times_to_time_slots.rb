class RenameTimesToTimeSlots < ActiveRecord::Migration
  def change
    rename_table :times, :time_slots
  end
end
