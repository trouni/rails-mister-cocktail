require 'faker'

class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews
  validates :name, presence: true, uniqueness: true
  mount_uploader :photo, PhotoUploader

  def self.search(search)
    if search
      where('LOWER(name) LIKE ?', "%#{search.downcase}%")
    else
      []
    end
  end

  def self.generate_name
    Faker::Hipster.words(2).map { |el| el.capitalize if el[0] === el[0].downcase }.join(" ")
  end

  def self.generate_photo_url
    "https://source.unsplash.com/collection/2284026/1600x1200?#{rand(10000000000)}"
  end
end
