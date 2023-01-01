class Mutations::Logout < Mutations::BaseMutation
  argument :auth_token, String, required: true
  def resolve(auth_token:)
    return false unless current_user

    token = current_user.authentication_tokens.find_by_token(auth_token)
    token&.update(invalidated_at: Time.zone.now)

    true
  end
end
