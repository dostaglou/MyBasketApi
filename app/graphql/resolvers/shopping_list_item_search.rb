class Resolvers::ShoppingListItemSearch < Resolvers::Base
  argument :shopping_list_item_id, ID, required: false
  argument :shopping_list_id, ID, required: false
  argument :statuses,
           [Types::ShoppingListItems::ShoppingListItemStatusEnum],
           required: false,
           default_value: ShoppingListItem.statuses.keys

  def resolve(statuses:, shopping_list_id: nil, shopping_list_item_id: nil)
    scope = current_user.shopping_list_items.where(status: statuses)

    return [scope.find(shopping_list_item_id)] if shopping_list_item_id

    scope = scope.where(shopping_list_id: shopping_list_id) if shopping_list_id

    scope
  end
end
