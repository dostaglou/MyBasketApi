class CreateShoppingListItems < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_list_items do |t|
      t.references  :shopping_list, foreign_key: true, null: false
      t.references  :catalogue_item, foreign_key: true, null: true
      t.string      :status, null: false
      t.integer     :quantity, null: false
      t.timestamps
    end
  end
end
