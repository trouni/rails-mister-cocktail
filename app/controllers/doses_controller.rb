class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]
  before_action :set_new_cocktail, only: [:create]

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      @show_edit_modal = true
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.new
    @new_cocktail = Cocktail.new
    @dose_to_destroy = Dose.find(params[:id])
    @cocktail = @dose_to_destroy.cocktail

    @dose_to_destroy.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_new_cocktail
    @new_cocktail = Cocktail.new
  end
end
