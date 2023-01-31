class Types::ShoppingListItemType < Types::BaseObject
  field :id, ID, null: false
  field :shopping_list_id, ID, null: false
  field :catalogue_item_id, ID, null: false
  field :status, String, null: false
  field :quantity, Integer, null: false
  field :name, String, null: false
  field :description, String, null: false
end
