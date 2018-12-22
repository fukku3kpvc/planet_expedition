class ExpeditionsController < ApplicationController
  before_action :set_model, except: [:new, :create, :index]

  def index
    @expedition = Expedition.all
  end

  def show
  end

  def create
    @expedition = Expedition.new(expedition_params)
    if @expedition.save
      redirect_to expeditions_path, notice: 'Сохранение прошло успешно'
    else
      flash[:alert] = 'Во время сохранения произошли ошибки'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_model
    @expedition = Expedition.find params[:id]
  end

  def expedition_params
    params.require(:expedition).permit(:title, :description)
  end
end
