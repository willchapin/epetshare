class CreateTimes < ActiveRecord::Migration
  def change
    create_table :times do |t|
      t.references :user, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.integer :time_type, null: false

      t.timestamps
    end
  end
end
