class Resolvers::ShoppingListItemSearch < Resolvers::Base
  argument :shopping_list_item_id, ID, required: false
  argument :shopping_list_id, ID, required: true

  def resolve(shopping_list_id:, shopping_list_item_id: nil)
    num = rand(5)
    ids = (1..20).to_a.sample(num)

    ids << shopping_list_item_id

    ids = ids.compact.uniq
    items = ids.map.with_index(1) do |id, index|
      {
        id: id * index,
        shopping_list_id: shopping_list_id,
        catalogue_item_id: id * ( index + 1 ),
        quantity: rand(5),
        status: %i(to_buy purchased).sample,
      }
    end
  end
end
