module Types
  class BaseObject < GraphQL::Schema::Object
    include SharedMethods
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
    field_class Types::BaseField
  end
end
