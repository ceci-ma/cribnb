class BookingsController < ApplicationController
  before_action :find_booking, only: [:show]

  def index
    @bookings = Booking.all
  end

  def show
    # id required in the params
    @booking = Booking.new(params[:id])
  end

  def new
    # as per the table a booking needs 2 foreign keys (flat and user)
#     @booking = Booking.new
#     @flat = Flat.find(params[:flat_id])
#     @user = User.find(params[:user_id])
  end

  def create
    # To review
    @booking = Booking.new(booking_params)
    @flat = Flat.find(params[:flat_id])
    @user = User.find(params[:user_id])
    @booking.flat = @flat
    @booking.user = @user
    if @booking.save
      redirect_to flats_path
    else
      render :new
    end
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
      params.require(:booking).permit(:start_date, :end_date, :price, :flat_id, :user_id )
  end


end
