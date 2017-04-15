class CreatePostTags < ActiveRecord::Migration[5.0]
  def change
    create_table :post_tags do |t|
      t.references :Post, foreign_key: true
      t.references :Tag, foreign_key: true

      t.timestamps
    end
  end
end
