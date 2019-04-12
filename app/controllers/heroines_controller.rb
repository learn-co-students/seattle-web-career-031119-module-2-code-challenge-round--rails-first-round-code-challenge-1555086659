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

  def search
    @heroines_all = Heroine.all
    @heroines = @heroines_all.select do |heroine|
      heroine.power.name.include?(search_value)
    end
    render :index
  end

  private

  def heroine_attributes
    params.require(:heroine).permit!
  end

  def search_value
    params.require(:q)
  end
end
