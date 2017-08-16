class RenameCategoryInProduct < ActiveRecord::Migration[5.1]
  def change
  		rename_column :products, :category, :category_id
  end
end
