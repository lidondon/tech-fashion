class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :category
      t.string :name
      t.string :size
      t.string :number
      t.text :description

      t.timestamps
    end
  end
end
