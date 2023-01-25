class Types::ShoppingListType < Types::BaseObject
  field :id, ID, null: false
  field :user_id, ID, null: false
  field :name, String, null: false
  field :unpurchased_item_count, Integer, null: false
  field :shopping_list_items, [Types::ShoppingListItemType], null: false
end
