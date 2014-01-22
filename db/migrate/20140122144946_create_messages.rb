class CreateMessages < ActiveRecord::Migration

  def change
    create_table :messages do |t|
      t.string :content, null: false
      t.string :title, null: false
      t.references :sender, :recipient, null: false
      
      t.timestamps
    end
  end
end
