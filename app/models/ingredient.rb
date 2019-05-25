# == Schema Information
#
# Table name: ingredients
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses
  validates :name, presence: true, uniqueness: true

  def self.search(search)
    if search
      where('name ILIKE ?', "%#{search}%")
    else
      []
    end
  end

  def generate_photo_url
    "https://source.unsplash.com/1600x1200?#{name.split(' ').join(',')}"
  end
end
