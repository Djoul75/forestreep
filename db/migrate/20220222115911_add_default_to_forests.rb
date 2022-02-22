class AddDefaultToForests < ActiveRecord::Migration[6.1]
  def change
    change_column :forests, :availability, :boolean, :default => false
  end
end
