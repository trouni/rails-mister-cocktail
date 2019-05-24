class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating, default: 1
      t.text :description
      t.references :cocktail, foreign_key: true

      t.timestamps
    end
  end
end
