class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :update]

  def index
    @cocktails = Cocktail.all
    @top_cocktails = @cocktails
  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
    @cocktail.remote_photo_url = Cocktail.generate_photo_url
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.remote_photo_url = params[:cocktail][:default_photo_url]
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def autogenerate
    @cocktail = Cocktail.new(name: Cocktail.generate_name)
    @cocktail.remote_photo_url = Cocktail.generate_photo_url
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
