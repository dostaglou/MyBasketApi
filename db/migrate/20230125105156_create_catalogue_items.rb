class CreateCatalogueItems < ActiveRecord::Migration[7.0]
  def change
    create_table :catalogue_items do |t|
      t.references :user, foreign_key: true, null: false
      t.string :name, null: false
      t.string :description, null: true
      t.timestamps
    end
  end
end
