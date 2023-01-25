# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  password   :string           not null
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  encrypts :password # non-determanistic encryption into the DB.
  validates :email, :password, :username, presence: true
  validates :password, length: { in: 6..20 }
  validates :username, length: { in: 3..40 }
  validates :email, uniqueness: true, if: :email_validator
  has_many :authentication_tokens
  has_many :shopping_lists
  has_many :catalogue_items
  has_many :shopping_list_items, through: :shopping_lists

  before_create :unify_email

  def valid_password?(password)
    self.password == password
  end

  private

    def unify_email
      self.email = self.email.downcase.strip
    end

    def email_validator
      unless self.email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        self.errors.add(:email, :not_a_valid_email)
      end
    end
end
