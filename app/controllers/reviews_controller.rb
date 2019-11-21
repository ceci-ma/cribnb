class ReviewsController < ApplicationController
  before_action :find_review, only: [:show]

  def index
    @review = Review.all
  end

  def show
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @flat = Flat.find(params[:flat_id])
    @review.flat = @flat

    if @review.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  private

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
