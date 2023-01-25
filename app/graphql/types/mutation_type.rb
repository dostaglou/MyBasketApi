module Types
  class MutationType < Types::BaseObject
    field(name: :signup, type: Types::AuthTokenType, mutation: Mutations::Signup)
    field(name: :login, type: Types::AuthTokenType, mutation: Mutations::Login)
    field(name: :logout, type: Boolean, mutation: Mutations::Logout)
    field(name: :logout_all, type: Boolean, mutation: Mutations::LogoutAll)
    field(name: :add_shopping_list_item, type: ShoppingListItemType, mutation: Mutations::ShoppingListItems::Add)
    field(name: :update_shopping_list_item, type: ShoppingListItemType, mutation: Mutations::ShoppingListItems::Update)
    field(name: :remove_shopping_list_item, type: ShoppingListItemType, mutation: Mutations::ShoppingListItems::Remove)
  end
end
