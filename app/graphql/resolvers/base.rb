class Resolvers::Base < GraphQL::Schema::Resolver
  include SharedMethods
  include ApiError
end
