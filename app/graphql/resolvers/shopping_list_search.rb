class Resolvers::ShoppingListSearch < Resolvers::Base
  argument :shopping_list_id, ID, required: false

  def resolve(shopping_list_id: nil)
    scope = current_user.shopping_lists

    return [scope.find(shopping_list_id)] if shopping_list_id

    scope
  end
end
