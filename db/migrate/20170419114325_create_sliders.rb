class CreateSliders < ActiveRecord::Migration[5.0]
  def change
    create_table :sliders do |t|
      t.string :image
      t.text :text
      t.belongs_to :page, foreign_key: true

      t.timestamps
    end
  end
end
