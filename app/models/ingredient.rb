class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses
  validates :name, presence: true, uniqueness: true

  def self.search(search)
    if search
      where('LOWER(name) LIKE ?', "%#{search.downcase}%")
    else
      []
    end
  end

  def generate_photo_url
    "https://source.unsplash.com/1600x1200?#{name.split(' ').join(',')}"
  end
end
