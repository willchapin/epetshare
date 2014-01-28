class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :user, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false

      t.timestamps
    end
  end
end
