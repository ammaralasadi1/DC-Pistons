class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.string :author_name
      t.references :article
      # Since you did add in user auth, you could add a reference to users in a new migration
      # to allow you to reference user info on the comment
      t.timestamps
    end
  end
end
