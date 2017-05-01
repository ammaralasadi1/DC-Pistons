class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :body
      t.string :author_name
      t.string :photo_url
      t.references :user

      t.timestamps
    end
  end
end
