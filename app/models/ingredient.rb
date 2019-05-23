class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses
  validates :name, presence: true, uniqueness: true

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      []
    end
  end
end
