class FlatsController < ApplicationController
  before_action :find_flat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @flats = Flat.where("location ILIKE ?", "%#{params[:search][:location]}%")
    else
      @flats = Flat.all
    end
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
    params.require(:flat).permit(:title, :description, :location, :price, photos: [])
  end
end




