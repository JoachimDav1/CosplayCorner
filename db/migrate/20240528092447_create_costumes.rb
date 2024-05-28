class CreateCostumes < ActiveRecord::Migration[7.1]
  def change
    create_table :costumes do |t|
      t.string :title
      t.string :description
      t.float :price_per_day

      t.timestamps
    end
  end
end
