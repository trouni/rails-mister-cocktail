class Review < ApplicationRecord
  belongs_to :cocktail
  validates :description, presence: true
  validates :rating, numericality: { only_integer: true }, :inclusion => 1..5
end
