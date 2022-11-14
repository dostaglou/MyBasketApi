# == Schema Information
#
# Table name: authentication_tokens
#
#  id             :bigint           not null, primary key
#  invalidated_at :datetime
#  token          :uuid
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_authentication_tokens_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class AuthenticationToken < ApplicationRecord
  belongs_to :user
  
  validates :token, presence: true

  class << self 
    def gen_token 
      SecureRandom.uuid
    end
  end

  def set_token 
    self.token = SecureRandom.uuid
  end
end
