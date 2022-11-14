class CreateAuthenticationTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :authentication_tokens do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :invalidated_at, null: true
      t.uuid :token

      t.timestamps
    end
  end
end
