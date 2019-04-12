class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
    if params[:search] && !params[:search].empty?
      @heroines = Heroine.joins(:power).where(:powers => {:name => params[:search]})
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
    @power = @heroine.power
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end


  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
