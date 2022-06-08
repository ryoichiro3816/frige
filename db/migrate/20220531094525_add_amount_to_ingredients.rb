class AddAmountToIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients, :amount, :integer
  end
end
