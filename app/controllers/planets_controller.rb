class PlanetsController < ApplicationController
  before_action :set_planet, except: [:new, :create, :index]
  def index
    @planets = Planet.all
  end

  def show
    @planet.itineraries.each do |itinerary|
      @expedition = itinerary.expedition
    end
  end

  def new
    @planet = Planet.new
  end

  def create
    @planet = Planet.new(planet_params)
    if @planet.save
      redirect_to planets_path, notice: 'Сохранение прошло успешно'
    end
    else
      flash[:alert] = 'Во время сохранения произошли ошибки'
      render :new
    end

  def edit
  end

  def update
    if @planet.update planet_params
      redirect_to planets_path, notice: 'Сохранение прошло успешно'
    else
      flash[:alert] = 'Во время сохранения произошли ошибки'
      render :edit
    end
  end

  def destroy
    @planet.destroy
    if @planet.destroyed?
      flash[:notice] = 'Удалено'
    else
      flash[:alert] = 'Ошибка удаления'
    end
    redirect_to planets_path
  end

  private

  def set_planet
    @planet = Planet.find(params[:id])
  end

  def planet_params
    params.require(:planet).permit(:title, :galaxy, :description, :distance)
  end
end
