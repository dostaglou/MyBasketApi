module Types
  class MutationType < Types::BaseObject
    field(name: :signup, type: Types::AuthTokenType, mutation: Mutations::Signup)
    field(name: :login, type: Types::AuthTokenType, mutation: Mutations::Login)
    field(name: :logout, type: Boolean, mutation: Mutations::Logout)
    field(name: :logout_all, type: Boolean, mutation: Mutations::LogoutAll)
  end
end
