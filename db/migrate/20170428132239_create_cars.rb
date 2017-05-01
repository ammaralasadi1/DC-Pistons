class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :title
      t.string :body
      t.string :make
      t.string :model
      t.integer :year
      t.string :price
      t.string :seller_name
      t.string :seller_phone
      t.string :photo_url
      t.references :user

      t.timestamps
    end
  end
end
