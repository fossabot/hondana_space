class CreateHondanaBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :hondana_books do |t|
      t.references :hondana, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
