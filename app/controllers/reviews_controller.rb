class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]

  def index
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews
    render json: @reviews
  end

  # POST /reviews
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)

    if @review.save
      render json: @review, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.require(:review).permit(:author, :rating, :headline, :body)
    end
end
