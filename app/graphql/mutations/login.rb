class Mutations::Login < Mutations::BaseMutation
  argument :email, String, required: true
  argument :password, String, required: true 

  def resolve(email:, password:) 
    user = User.find_by(email: email)

    unless user && user.password == password
      return GraphQL::ExecutionError.new("unfound", extensions: { code: :unauthorized })
    end
    
    token = AuthenticationToken.gen_token
    user.authentication_tokens.create!(token: token)

    { token: token }
  end
end