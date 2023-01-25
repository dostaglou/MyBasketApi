class Mutations::ShoppingListItems::Update < Mutations::BaseMutation
  argument :shopping_list_item_id, ID, required: true
  argument :status, Types::ShoppingListItems::ShoppingListItemStatusEnum, required: false
  argument :quantity, Integer, required: false

  def resolve(shopping_list_item_id:, status: nil, quantity: nil)
    list_item = ShoppingListItem.find(shopping_list_item_id)
    list_item.status = status if status
    list_item.quantity = quantity if quantity

    list_item.update!

    list_item
  end
end
