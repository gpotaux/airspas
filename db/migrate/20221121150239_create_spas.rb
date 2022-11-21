class CreateSpas < ActiveRecord::Migration[7.0]
  def change
    create_table :spas do |t|
      t.string :name
      t.string :address
      t.integer :price_per_hour
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
