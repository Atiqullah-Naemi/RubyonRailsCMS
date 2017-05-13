class CreateRepeaters < ActiveRecord::Migration[5.0]
  def change
    create_table :repeaters do |t|
      t.string :image
      t.text :content
      t.belongs_to :page, foreign_key: true

      t.timestamps
    end
  end
end
