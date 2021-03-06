class PagesController < ApplicationController
  before_action :set_new_cocktail

  def home
    @cocktails = Cocktail.all
    @top_cocktails = Cocktail.best_rated
    @most_popular = Cocktail.most_popular
  end

  def search
    @keyword = (params[:search] || params[:home_search])[:keyword]
    @cocktails = Cocktail.search(@keyword)
    @ingredients = Ingredient.search(@keyword)
  end

  private

  def set_new_cocktail
    @new_cocktail = Cocktail.new
  end
end
