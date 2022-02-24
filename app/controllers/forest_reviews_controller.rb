class ForestReviewsController < ApplicationController
  def new
    @forest = Forest.find(params[:forest_id])
    @review = ForestReview.new
    authorize @review
  end

  def create
    @forest = Forest.find(params[:forest_id])
    @review = ForestReview.new(review_params)
    authorize @review
    @review.forest = @forest
    @review.user = current_user
    if @review.save
      redirect_to forest_path(@forest)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:forest_review).permit(:comment, :rating)
  end
end
