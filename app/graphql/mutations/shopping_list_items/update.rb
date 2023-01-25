class Mutations::ShoppingListItems::Update < Mutations::BaseMutation
  argument :shopping_list_item_id, ID, required: true
  argument :shopping_list_item_details,
           Types::ShoppingListItems::ShoppingListItemInput,
           required: true

  def resolve(shopping_list_item_id:, shopping_list_item_details:)
    sli = ShoppingListItem.find(shopping_list_item_id)

    sli.update!(shopping_list_item_details)

    sli
  end
end
