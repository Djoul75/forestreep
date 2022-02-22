class CreateForestReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :forest_reviews do |t|
      t.text :comment
      t.float :rating
      t.references :user, null: false, foreign_key: true
      t.references :forest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
