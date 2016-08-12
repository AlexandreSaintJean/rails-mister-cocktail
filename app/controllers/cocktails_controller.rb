class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show]

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
    @dose = Dose.new
  end


  def create
    @cocktail = Cocktail.new(cocktail_params)
      if @cocktail.save
        redirect_to cocktails_path(@cocktail.id)
      else
        render :new
      end
  end

  private

    def find_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    def cocktail_params
      params.require(:cocktail).permit(:name, :description, photos: [] )
    end
end
