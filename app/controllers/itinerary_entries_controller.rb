class ItineraryEntriesController < ApplicationController
  before_action :set_itinerary_entry, except: [:new, :create, :index]

  def index
    @itinerary_entries = ItineraryEntry.all
  end

  def new
    @itinerary_entry = ItineraryEntry.new
    @expeditions = Expedition.all
  end

  def create
    @itinerary_entry = ItineraryEntry.new(itinerary_entry_params)
    if @itinerary_entry.save
      flash[:notice] = 'Saved successfully'
      redirect_to itinerary_entries_path
    else
      flash[:alert] = 'Errors appeared during creating'
      render :new
    end
  end

  def edit
  end

  def update
    if @itinerary_entry.update itinerary_entry_params
      flash[:notice] = 'Updated successfully'
      redirect_to itinerary_entries_path
    else
      flash[:alert] = 'Errors appeared during creating'
      render :edit
    end
  end

  def destroy
    @itinerary_entry.destroy
    if @itinerary_entry.destroyed?
      flash[:notice] = 'Successfully deleted'
    else
      flash[:alert] = 'Errors appeared while deleting'
    end
    redirect_to itinerary_entries_path
  end

  private

  def itinerary_entry_params
    params.require(:itinerary_entry).permit(:value, :planet_id, :itinerary_id)
  end

  def set_itinerary_entry
    @itinerary_entry = ItineraryEntry.find(params[:id])
  end
end
