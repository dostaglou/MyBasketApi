module Resolvers
  class CatalogueItemSearch < Resolvers::Base
    argument :catalogue_item_id, ID, required: false

    type [Types::CatalogueItemType], null: false

    def resolve(catalogue_item_id: nil)
      scope = current_user.catalogue_items

      return [scope.find(catalogue_item_id)] if catalogue_item_id

      scope
    end
  end
end
