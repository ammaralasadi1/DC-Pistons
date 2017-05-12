class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :body
      t.string :author_name
      t.string :photo_url
      t.references :user, foreign_key: true
      # It is best practice to include the foreign_key constraint on references (makes queries faster)
      t.timestamps
    end
  end
end
