# == Schema Information
#
# Table name: cocktails
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  photo      :string
#

require 'faker'

class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  mount_uploader :photo, PhotoUploader

  def self.search(search)
    if search
      where('name ILIKE ?', "%#{search}%")
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

  def self.best_rated
    all.select { |cocktail| cocktail.reviewed? }.sort_by { |cocktail| cocktail.rating }.reverse
  end

  def self.most_reviewed
    all.select { |cocktail| cocktail.reviewed? }.sort_by { |cocktail| cocktail.reviews.count }.reverse
  end

  def self.most_popular
    all.select { |cocktail| cocktail.reviewed? }.sort_by { |cocktail| cocktail.rank_score }.reverse
  end

  def self.not_reviewed
    all.reject { |cocktail| cocktail.reviewed? }
  end

  def rating
    return nil if reviews.count == 0

    (reviews.map { |review| review.rating }.reduce(:+) / reviews.count.to_f).round(1)
  end

  def rank_score
    rating * reviews.count
  end

  def reviewed?
    reviews.count != 0
  end
end
