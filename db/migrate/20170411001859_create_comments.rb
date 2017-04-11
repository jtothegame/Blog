class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.string :user
      t.references :post, foreign_key: true, index: true

      t.timestamps
    end
  end
end
