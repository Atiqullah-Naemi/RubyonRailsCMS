class CreatePostCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :post_categories do |t|
      t.references :Post, foreign_key: true
      t.references :Category, foreign_key: true

      t.timestamps
    end
  end
end
