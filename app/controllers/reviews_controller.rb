class ReviewsController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

 # if @review.save
 #      redirect_to cocktail_path(@review.cocktail)
 #    else
 #      render :new
 #    end
