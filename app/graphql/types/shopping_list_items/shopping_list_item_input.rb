class Types::ShoppingListItems::ShoppingListItemInput < Types::BaseInputObject
  argument :name, String, required: false
  argument :description, String, required: false
  argument :status, Types::ShoppingListItems::ShoppingListItemStatusEnum, required: false
end
