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
    # byebug
    @heroine = Heroine.create(heroine_params)
    if @heroine.save
      redirect_to heroines_path
    else
      render :new
    end
    # redirect_to heroines_path
  end

  def search
    # byebug
    @power_choice = Power.all.find do |p|
      p.name == params[:power_search]
    end
    @heroines_by_power = Heroine.all.select do |h|
      h.power == @power_choice
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
