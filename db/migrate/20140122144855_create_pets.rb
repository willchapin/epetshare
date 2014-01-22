class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name, null: false
      t.references :user, null: false
      t.integer :species, null: false
      t.string :food_preferences
      t.boolean :is_social

      t.timestamps
    end

    add_index(:pets, [:user_id, :name], unique: true)
  end
end
