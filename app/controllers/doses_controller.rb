class DosesController < ApplicationController


  def create
    @dose = Dose.new(dose_params)
      if @dose.save
        redirect_to cocktail_path(@dose.cocktail)
      else
        render '/cocktails/show'
      end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.delete
    redirect_to cocktails_path
  end

  private

    def dose_params
      params.require(:dose).permit(:id, :description, :ingredient_id, :cocktail_id)
    end

end
