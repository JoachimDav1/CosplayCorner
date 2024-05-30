class AddingColumnsToCostume < ActiveRecord::Migration[7.1]
  def change
    add_column :costumes, :category, :string
    add_column :costumes, :size, :string
  end
end
