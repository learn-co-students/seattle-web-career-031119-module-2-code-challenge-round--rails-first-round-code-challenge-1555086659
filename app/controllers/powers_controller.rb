class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    @power = Power.find(params[:id])
  end

  def new
    @power = Power.new
  end

  def create
    @power = Power.new(power_params)
    if @power.save
      redirect_to @power
    else
      render :new
    end
  end

  private

    def power_params
      params.require(:power).permit!
    end

end
