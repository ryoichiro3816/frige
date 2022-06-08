class RemovePictureFromIngredients < ActiveRecord::Migration[6.1]
  def change
    remove_column :ingredients, :picture, :string
  end
end
