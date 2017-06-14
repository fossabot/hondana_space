class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.string :manufacturer
      t.string :amazon_url
      t.string :image_url

      t.timestamps
    end
    add_index :books, :isbn, unique: true
  end
end
