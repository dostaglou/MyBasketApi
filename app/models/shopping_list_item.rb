# == Schema Information
#
# Table name: shopping_list_items
#
#  id                :bigint           not null, primary key
#  quantity          :integer          not null
#  status            :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  catalogue_item_id :bigint
#  shopping_list_id  :bigint           not null
#
# Indexes
#
#  index_shopping_list_items_on_catalogue_item_id  (catalogue_item_id)
#  index_shopping_list_items_on_shopping_list_id   (shopping_list_id)
#
# Foreign Keys
#
#  fk_rails_...  (catalogue_item_id => catalogue_items.id)
#  fk_rails_...  (shopping_list_id => shopping_lists.id)
#
class ShoppingListItem < ApplicationRecord
  belongs_to :shopping_list
  belongs_to :catalogue_item
  validates :catalogue_item_id, uniqueness: { scope: :shopping_list_id }

  enum status: {
    pending: 1,
    picked_up: 2
  }
end
