class CreateOrganisations < ActiveRecord::Migration[5.1]
  def change
    create_table :organisations do |t|
      t.string :subdomain, null: false

      t.timestamps
    end
    add_index :organisations, :subdomain, unique: true
  end
end
