class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.date :expiry
      t.integer :number

      t.timestamps
    end
  end
end
