class CocktailsController < ApplicationController
  before_action :set_cocktail, only: :show
  before_action :set_new_cocktail

  def index
    @cocktails = Cocktail.all
    @top_cocktails = @cocktails
  end

  def show
    @dose = Dose.new
  end

  def new
  end

  def create
    @cocktails = Cocktail.all
    @top_cocktails = @cocktails
    @new_cocktail = Cocktail.new(cocktail_params)
    if @new_cocktail.save
      redirect_to cocktail_path(@new_cocktail)
    else
      # render :index
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def set_new_cocktail
    @new_cocktail = Cocktail.new
  end
end
