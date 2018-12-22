class GalaxiesController < ApplicationController
  def new
    @galaxy = Galaxy.new
  end

  def create
    @galaxy = Galaxy.new(galaxy_params)
    if @galaxy.save
      redirect_to galaxies_path, notice: 'Сохранение прошло успешно'
    else
      flash[:alert] = 'Во время сохранения произошли ошибки'
      render :new
    end
  end

  def index
    @galaxies = Galaxy.all
  end

  private

  def galaxy_params
    params.require(:galaxy).permit(:title)
  end
end
