module Resolvers
  class CatalogueItemSearch < Resolvers::Base
    argument :catalogue_item_id, ID, required: false

    type [Types::CatalogueItemType], null: false

    def resolve(catalogue_item_id: nil)
      ids = (1..20).to_a.sample(5)

      ids.map do |id|
        {
          id: id,
          user_id: 1,
          name: "#{id}名",
          description: "This is a description for #{id}",
          image_url: "https://loremflickr.com/cache/resized/65535_52481809352_5166dd7d53_n_320_240_nofilter.jpg"
        }
      end
    end
  end
end
