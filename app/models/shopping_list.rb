# == Schema Information
#
# Table name: shopping_lists
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_shopping_lists_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class ShoppingList < ApplicationRecord
  belongs_to :user
  has_many :shopping_list_items

  validates :name, presence: true
end
