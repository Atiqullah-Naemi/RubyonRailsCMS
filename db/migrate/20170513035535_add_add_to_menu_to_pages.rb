class AddAddToMenuToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :add_to_menu, :boolean
  end
end
