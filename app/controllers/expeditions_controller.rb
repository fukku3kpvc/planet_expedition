class ExpeditionsController < ApplicationController
  before_action :set_model, except: [:new, :create, :index, :react]
  # skip_before_action :authenticate_user!
  after_action :create_notifier, only: %I[create]
  after_action :destroy_notifier, only: %I[destroy]

  def index
    authorize Expedition
    @expeditions = Expedition.all
    respond_to do |format|
      format.html
      format.json { render json: @expedition }
    end
  end

  def new
    authorize Expedition
    @expedition = Expedition.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
  end

  def create
    authorize Expedition
    @expedition = Expedition.new(expedition_params)
    if @expedition.save
      respond_to do |format|
        format.html { redirect_to expeditions_path, notice: 'Сохранение прошло успешно' }
        format.js
      end
    else
      flash[:alert] = 'Во время сохранения произошли ошибки'
      render :new
    end
  end

  def edit
  end

  def update
    if @expedition.update expedition_params
      redirect_to expeditions_path, notice: 'Сохранение прошло успешно'
    else
      flash[:alert] = 'Во время сохранения произошли ошибки'
      render :edit
    end
  end

  def destroy
    @expedition.destroy
    respond_to do |format|
      format.html do
        if @expedition.destroyed?
          flash[:notice] = 'Удалено'
        else
          flash[:alert] = 'Ошибка удаления'
        end
        redirect_to expeditions_path
      end
      format.js
    end
  end

  private

  def set_model
    @expedition = Expedition.find params[:id]
    authorize @expedition
  end

  def expedition_params
    params.require(:expedition).permit(:title, :description)
  end

  def create_notifier
    ActionCable.server.broadcast ExpeditionsChannel::TITLE,
                                 partial: render_to_string(
                                     partial: "expeditions/expedition", object: @expedition
                                 ),
                                 action: :create.to_s,
                                 id: @expedition.id
  end

  def destroy_notifier
    ActionCable.server.broadcast ExpeditionsChannel::TITLE,
                                 partial: render_to_string(
                                     partial: 'expeditions/expedition', object: @expedition
                                 ),
                                 action: :destroy.to_s,
                                 id: @expedition.id
  end
end
