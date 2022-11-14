class Mutations::LogoutAll < Mutations::BaseMutation 
  def resolve 
    return false unless current_user
    tokens = current_user.authentication_tokens.where(token: nil)
    time = Time.zone.now
    tokens.update_all(invalidated_at: time, updated_at: time)
    true
  end 
end