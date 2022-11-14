module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

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
