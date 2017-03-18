class ReviewsController < ApplicationController
  before_action :require_login

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to product_path(@review.product), notice: 'Review created!'
    else
      redirect_to products_path, notice: 'Review not created. Please sign in.'
    end
  end

  def destroy
    @rev = Review.find(params["id"])
    @rev.destroy
    redirect_to product_path(params[:product_id])
  end

  private

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to create a review"
    end
  end

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    ).merge({
      user_id: current_user.id,
      product_id: params[:product_id]
    })

  end

end
