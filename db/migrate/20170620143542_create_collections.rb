class CreateCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :collections do |t|
      t.references :organisation, foreign_key: true, null: false
      t.references :book, foreign_key: true, null: false

      t.timestamps
    end
  end
end
