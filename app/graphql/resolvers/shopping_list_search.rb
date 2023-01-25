class Resolvers::ShoppingListSearch < Resolvers::Base
  argument :shopping_list_id, ID, required: false

  def resolve(shopping_list_id: nil)
    num = rand(5)
    ids = (1..20).to_a.sample(num)

    ids << shopping_list_id

    ids = ids.compact.uniq

    ids.map do |id|
      {
        id: id,
        user_id: 1,
        name: "#{id}名",
        unpurchased_item_count: rand(10),
        shopping_list_items: []
      }
    end
  end
end
