class Mutations::ShoppingListItems::Add < Mutations::BaseMutation
  argument :shopping_list_id, ID, required: true
  argument :catalogue_item_id, ID, required: true
  argument :shopping_list_item_details,
           Types::ShoppingListItems::ShoppingListItemInput,
           required: true

  def resolve(shopping_list_id:, shopping_list_item_details:)
    list = ShoppingListItem.find(shopping_list_id) # reduce to validation?
    item = CatalogueItem.find(catalogue_item_id) # reduce to validation?

    attributes = shopping_list_item_details.merge(catalogue_item_id: item.id, shopping_list_id: list.id)
    list_item = ShoppingListItem.create!(attributes)

    list_item
  end
end
