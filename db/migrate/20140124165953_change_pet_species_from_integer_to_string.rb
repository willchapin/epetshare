class ChangePetSpeciesFromIntegerToString < ActiveRecord::Migration
  def change
    change_column :pets, :species, :string
  end
end
