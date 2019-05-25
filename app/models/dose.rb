# == Schema Information
#
# Table name: doses
#
#  id            :bigint           not null, primary key
#  cocktail_id   :bigint
#  ingredient_id :bigint
#  description   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates :ingredient, :uniqueness => { :scope => :cocktail }
end
