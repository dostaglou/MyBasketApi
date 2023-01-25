class Mutations::ShoppingListItems::Add < Mutations::BaseMutation
  argument :shopping_list_id, ID, required: true
  argument :catalogue_item_id, ID, required: true
  argument :quantity, Integer, required: true

  def resolve(shopping_list_id:, catalogue_item_id:, quantity:)
    list = current_user.shopping_lists.find(shopping_list_id) # reduce to validation?
    item = current_user.catalogue_items.find(catalogue_item_id) # reduce to validation?

    attributes = {
      shopping_list_id: list.id,
      catalogue_item_id: item.id,
      quantity: quantity
    }

    list_item = ShoppingListItem.create!(attributes)

    list_item
  end
end
