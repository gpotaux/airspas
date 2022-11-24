class RemoveSpaFromReviews < ActiveRecord::Migration[7.0]
  def change
    remove_reference :reviews, :spa, null: false, foreign_key: true
  end
end
