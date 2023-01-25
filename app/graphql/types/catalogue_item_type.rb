class Types::CatalogueItemType < Types::BaseObject
  field :id, ID, null: false
  field :user_id, ID, null: false
  field :name, String, null: false
  field :description, String, null: false
  field :image_url, String, null: true
end
