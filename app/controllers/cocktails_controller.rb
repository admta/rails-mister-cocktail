class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.valid?
      @cocktail.save!
      redirect_to @cocktail
    else
      render :new
    end
  end

  def edit
  end

  def update
   @cocktail.update(task_params)
   redirect_to task_path(@task)
 end

 def destroy
  @cocktail = Cocktail.find(params[:id])
  @cocktail.destroy
  redirect_to root_path
end

private

def set_cocktail
  @cocktail = Cocktail.find(params[:cocktail_id])

  @dose = Dose.find(params[:id])
end

def cocktail_params
  params.require(:cocktail).permit(:name)
end
end
