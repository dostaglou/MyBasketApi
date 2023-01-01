class Mutations::Login < Mutations::BaseMutation
  argument :email, String, required: true
  argument :password, String, required: true

  def resolve(email:, password:)
    email = clean_input(email)

    user = User.find_by(email: email)

    unless user && user.valid_password?(password)
      return GraphQL::ExecutionError.new("unfound", extensions: { code: :unauthorized })
    end

    token = AuthenticationToken.gen_token
    user.authentication_tokens.create!(token: token)

    { token: token }
  end

  def clean_input(value)
    value.strip.downcase
  end
end
