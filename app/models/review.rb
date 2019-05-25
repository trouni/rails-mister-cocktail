# == Schema Information
#
# Table name: reviews
#
#  id          :bigint           not null, primary key
#  rating      :integer          default(1)
#  description :text
#  cocktail_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Review < ApplicationRecord
  belongs_to :cocktail
  validates :description, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }

  def self.most_relevant
    all.select { |cocktail| cocktail.reviewed? }.sort_by { |cocktail| cocktail.rank_score }.reverse
  end
end
