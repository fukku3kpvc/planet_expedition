class SpaceshipsController < ApplicationController
  before_action :set_spaceship, except: [:new, :create, :index, :react]
  # skip_before_action :authenticate_user!
  after_action :create_notifier, only: %I[create]
  after_action :destroy_notifier, only: %I[destroy]

  def index
    authorize Spaceship
    @spaceships = Spaceship.all
    @spaceship = Spaceship.new
    respond_to do |format|
      format.html
      format.json { render json: @spaceships.to_json(include: [:expedition]) }
    end
  end

  def show
  end

  def new
    authorize Spaceship
    @spaceship = Spaceship.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    authorize Spaceship
    @spaceship = Spaceship.new spaceship_params
    if @spaceship.save
      respond_to do |format|
        format.html { redirect_to spaceships_path, notice: 'Сохранение прошло успешно' }
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
    authorize Spaceship
    if @spaceship.update spaceship_params
      redirect_to spaceships_path, notice: 'Сохранение прошло успешно'
    else
      flash[:alert] = 'Во время сохранения произошли ошибки'
      render :edit
    end
  end

  def destroy
    authorize Spaceship
    @spaceship.destroy
    respond_to do |format|
      format.html do
        if @spaceship.destroyed?
          flash[:notice] = 'Удалено'
        else
          flash[:alert] = 'Ошибка удаления'
        end
      end
      format.js
    end
  end

  private


  def set_spaceship
    @spaceship = Spaceship.find params[:id]
  end


  def spaceship_params
    params.require(:spaceship).permit(:title, :expedition_id, :velocity)
  end

  def create_notifier
    ActionCable.server.broadcast SpaceshipsChannel::TITLE,
                                 partial: render_to_string(
                                     partial: "spaceships/spaceship", object: @spaceship
                                 ),
                                 action: :create.to_s,
                                 id: @spaceship.id
  end

  def destroy_notifier
    ActionCable.server.broadcast SpaceshipsChannel::TITLE,
                                 partial: render_to_string(
                                     partial: "spaceships/spaceship", object: @spaceship
                                 ),
                                 action: :destroy.to_s,
                                 id: @spaceship.id
  end
end
