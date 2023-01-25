module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field(name: :catalogue_item_search, resolver: Resolvers::CatalogueItemSearch, type: [Types::CatalogueItemType], null: false)
    field(name: :shopping_list_search, resolver: Resolvers::ShoppingListSearch, type: [Types::ShoppingListType], null: false)
    field(name: :shopping_list_item_search, resolver: Resolvers::ShoppingListItemSearch, type: [Types::ShoppingListItemType], null: false)

    # field :catalogue_item_search, [Types::CatalogueItemType], resolver: Resolvers::CatalogueItemSearch
    field :private_data, String, null: false

    def private_data
      if current_user.is_a?(User)
        "this is private"
      else
        return GraphQL::ExecutionError.new("Naught, naughty", extensions: { code: :unauthorized })
      end
    end
  end
end
