class CreateHondanas < ActiveRecord::Migration[5.1]
  def change
    create_table :hondanas do |t|
      t.references :organisation, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
