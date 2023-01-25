# == Schema Information
#
# Table name: shopping_list_items
#
#  id                :bigint           not null, primary key
#  quantity          :integer          not null
#  status            :integer          default("pending"), not null
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
require "test_helper"

class ShoppingListItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
