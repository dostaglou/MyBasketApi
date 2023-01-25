class Mutations::ShoppingListItems::Remove < Mutations::BaseMutation
  argument :shopping_list_item_id, ID, required: true

  def resolve(shopping_list_item_id:, shopping_list_item_details:)
    sli = ShoppingListItem.find(shopping_list_item_id)

    sli.destroy!

    sli
  end
end
