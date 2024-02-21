class CreateEcomms < ActiveRecord::Migration[7.1]
  def change
    create_table :ecomms do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :location

      t.timestamps
    end
  end
end
