class ExpeditionsController < ApplicationController
  before_action :set_model, except: [:new, :create, :index]

  def index
    @expedition = Expedition.all
  end

  def show
  end

  def create
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
