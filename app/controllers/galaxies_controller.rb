class GalaxiesController < ApplicationController
  before_action :set_galaxy, except: [:new, :create, :index]

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

  def edit
  end

  def update
    if @galaxy.update galaxy_params
      redirect_to galaxy_path, notice: 'Successfully saved'
    else
      flash[:alert] = 'Errors appeared while saving'
      render :edit
    end
  end

  def destroy
    @galaxy.destroy
    if @galaxy.destroyed?
      flash[:notice] = 'Destroyed successfully'
    else
      flash[:alert] = 'Error appeared while destroying'
    end
    redirect_to galaxies_path
  end

  def show
  end

  private

  def galaxy_params
    params.require(:galaxy).permit(:title)
  end

  def set_galaxy
    @galaxy = Galaxy.find(params[:id])
  end
end
