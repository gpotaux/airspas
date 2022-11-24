class AddRatingToSpas < ActiveRecord::Migration[7.0]
  def change
    add_column :spas, :rating, :float
  end
end
