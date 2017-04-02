class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.string :site_name
      t.integer :posts_per_page
      t.string :logo

      t.timestamps
    end
  end
end
