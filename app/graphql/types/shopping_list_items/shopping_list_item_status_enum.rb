class Types::ShoppingListItems::ShoppingListItemStatusEnum < Types::BaseEnum
  ShoppingListItem.statuses.each do |status, _|
    value status
  end
end
