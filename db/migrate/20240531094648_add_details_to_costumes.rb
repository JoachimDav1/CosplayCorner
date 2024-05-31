class AddDetailsToCostumes < ActiveRecord::Migration[7.1]
  def change
    add_column :costumes, :details, :string
  end
end
