class ReviewsController < ApplicationController
  before_action :set_cocktail

  def index
    @reviews = @cocktail.reviews
    @review = Review.new
  end

  def create
    @dose = Dose.new
    @review = Review.new(review_params)
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
