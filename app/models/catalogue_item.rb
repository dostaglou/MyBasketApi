# == Schema Information
#
# Table name: catalogue_items
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_catalogue_items_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class CatalogueItem < ApplicationRecord
  belongs_to :user
  has_many :shopping_list_items

  validates :name, presence: true
end
