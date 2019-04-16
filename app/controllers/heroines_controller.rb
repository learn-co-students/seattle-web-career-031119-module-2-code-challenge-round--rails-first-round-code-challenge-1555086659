class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
    # @search = Heroine.find(params[:id])
    # @heroines = Heroine.by_power(@search.power)
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      flash[:message] = "Superheroine Created!"
      redirect_to @heroine
    else
      render :new
    end
  end

  def edit
    @heroine = Heroine.find(params[:id])
  end

  def update
    @heroine = Heroine.find(params[:id])
    if @heroine.update(heroine_params)
      flash[:message] = "Superheroine Updated!"
      redirect_to @heroine
    else
      render :edit
    end
  end

  def destroy
    @heroine = Heroine.find(params[:id])
    @heroine.destroy
    flash[:message] = "Superheroine Destroyed!"
    redirect_to heroines_path
  end

private

  def heroine_params
    params.require(:heroine).permit!
  end

end
