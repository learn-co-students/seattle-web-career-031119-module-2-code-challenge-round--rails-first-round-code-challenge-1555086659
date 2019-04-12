class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_attributes)
    if @heroine.save
      redirect_to @heroine
    else
      render :new
    end
  end

  private

  def heroine_attributes
    params.require(:heroine).permit!
  end
end
