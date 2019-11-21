class FlatsController < ApplicationController
  before_action :find_flat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @flats = Flat.near("#{params[:search][:location]}", 10).where(guests: params[:search][:guests])
      @geo_flats = Flat.geocoded.near("#{params[:search][:location]}", 10).where(guests: params[:search][:guests])
      @markers = @geo_flats.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude
        }
      end
    else
      @flats = Flat.all
      @geo_flats = Flat.geocoded
      @markers = @geo_flats.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude
        }
      end
    end
    # Added for geocoding
  end

  def show
    @booking = Booking.new
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to flats_path
    else
      render :edit
    end
  end

  def destroy
    # console.log("abc")
    @flat.destroy
    redirect_to flats_path
  end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:title, :description, :location, :price, :guests, :bedrooms, photos: [])
  end
end




