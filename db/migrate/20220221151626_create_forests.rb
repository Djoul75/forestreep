class CreateForests < ActiveRecord::Migration[6.1]
  def change
    create_table :forests do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :address
      t.string :tree
      t.string :animals
      t.float :price
      t.integer :size
      t.boolean :availability

      t.timestamps
    end
  end
end
