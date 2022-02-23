class AddCoordinatesToForests < ActiveRecord::Migration[6.1]
  def change
    add_column :forests, :latitude, :float
    add_column :forests, :longitude, :float
  end
end
