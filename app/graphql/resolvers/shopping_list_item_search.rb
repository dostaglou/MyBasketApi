class Resolvers::ShoppingListItemSearch < Resolvers::Base
  argument :shopping_list_item_id, ID, required: false
  argument :shopping_list_id, ID, required: false

  def resolve(shopping_list_id: nil, shopping_list_item_id: nil)
    scope = current_user.shopping_list_items

    return [scope.find(shopping_list_item_id)] if shopping_list_item_id

    scope = scope.where(shopping_list_id: shopping_list_id) if shopping_list_id

    scope
  end
end
