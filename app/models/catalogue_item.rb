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

  before_save :clean_name, if: -> (item) { item.will_save_change_to_name? }
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }


  private
    def clean_name
      self.name = self.name.strip
    end
end
