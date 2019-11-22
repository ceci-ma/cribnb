class FlatsController < ApplicationController

  before_action :find_flat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @flats = Flat.near("#{params[:search][:location]}", 10).where(guests: params[:search][:guests])
      @geo_flats = Flat.geocoded.near("#{params[:search][:location]}", 10).where(guests: params[:search][:guests])
      @markers = @geo_flats.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { flat: flat }),
          image_url: helpers.asset_url('https://lh3.googleusercontent.com/3kJvHS_h2h8_knIlipZFTFrWKLpntzZzaunGVIXRlCnOLKR_bo7XOv4On2sLu9TC5M-_JxTSlCOfGYsepGa4aPdorPrqKf85UgQIywRj0xmIPu1ezv9XYUAyKjfDbo8v-1WCElFJXKDXLT0LYOx_f_rBma4KHxClSwliXkmvuIGaebukvWvFrp4abK86PLGwi5VUGYqjTE0hFYiRK3yDCkgbDJNH-zlD4k7T5Fta2SoeGJENsehKybdZGIhDY9p3zj0uyN9Ji8azxTix2-4KrRttgCNkeZxigH9iC6o2QjF2HxWd2QfM-QzkVr8EGoWz3Blc-A-asnO3yqeKEHJ_hZJwWx3B_pCMYGHHLVTtOYaogK8BSVJpj8K9h9WB1CQIQVndHzFB3yJ3t5TsfYUUrwq5fFm79mxpcQE8-i-mXtwkzNA3f4KghUh9QD8C2iE-EVn73jnDLoR4cXGhractpFqxjwjAUccMY9yW1HOv8jDXIq0T6HouAQBPpyv2wBzs07QQO9ChXWSXCcryZwUgtnCYK3BxmlgZlx_EQqvWMUoqu_5jUA-rpC2omwfWJSHVANqjmhJK4lp8I3xx0bdqAXNixvYDpIyZrdDEiYBvZ2ukvNfTopv8B-Dr98QJqCFqFdaPpjolj5DWAydV3L_g7Y9RoCrUztqh5-EZgD_rFOTkrkL8hlLqH4Ge=s512-no')

        }
      end
    else
      @flats = Flat.all
      @geo_flats = Flat.geocoded
      @markers = @geo_flats.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { flat: flat }),
          image_url: helpers.asset_url('https://lh3.googleusercontent.com/3kJvHS_h2h8_knIlipZFTFrWKLpntzZzaunGVIXRlCnOLKR_bo7XOv4On2sLu9TC5M-_JxTSlCOfGYsepGa4aPdorPrqKf85UgQIywRj0xmIPu1ezv9XYUAyKjfDbo8v-1WCElFJXKDXLT0LYOx_f_rBma4KHxClSwliXkmvuIGaebukvWvFrp4abK86PLGwi5VUGYqjTE0hFYiRK3yDCkgbDJNH-zlD4k7T5Fta2SoeGJENsehKybdZGIhDY9p3zj0uyN9Ji8azxTix2-4KrRttgCNkeZxigH9iC6o2QjF2HxWd2QfM-QzkVr8EGoWz3Blc-A-asnO3yqeKEHJ_hZJwWx3B_pCMYGHHLVTtOYaogK8BSVJpj8K9h9WB1CQIQVndHzFB3yJ3t5TsfYUUrwq5fFm79mxpcQE8-i-mXtwkzNA3f4KghUh9QD8C2iE-EVn73jnDLoR4cXGhractpFqxjwjAUccMY9yW1HOv8jDXIq0T6HouAQBPpyv2wBzs07QQO9ChXWSXCcryZwUgtnCYK3BxmlgZlx_EQqvWMUoqu_5jUA-rpC2omwfWJSHVANqjmhJK4lp8I3xx0bdqAXNixvYDpIyZrdDEiYBvZ2ukvNfTopv8B-Dr98QJqCFqFdaPpjolj5DWAydV3L_g7Y9RoCrUztqh5-EZgD_rFOTkrkL8hlLqH4Ge=s512-no')
        }
      end
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
    @flat.delete
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



