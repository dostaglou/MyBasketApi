class Mutations::Signup < Mutations::BaseMutation
  argument :email, String, required: true 
  argument :password, String, required: true 
  argument :username, String, required: true

  def resolve(email:, password:, username:)
    user = User.new(email: email, password: password, username: username) 
    
    if user.invalid?
      return GraphQL::ExecutionError.new(user.errors.messages, extensions: { code: :invalid })
    end 
    
    token = AuthenticationToken.gen_token
    ActiveRecord::Base.transaction do 
      user.save!
      AuthenticationToken.create!(user_id: user.id, token: token)
    end

    { token: token }
  end
end