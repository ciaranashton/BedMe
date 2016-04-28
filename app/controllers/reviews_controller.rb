class ReviewsController < ApplicationController
      before_action :logged_in_user, only: [:create, :destroy]
      before_action :correct_user,   only: :destroy
  
  def create
    @user = User.find(current_user)
    @review = current_property.review.build(review_params)
    if @review.save
      flash[:success] = "Review Added"
      redirect_to current_property
    else
      #flash[:danger] = "Review not added please report this to the site admin."
      redirect_to current_property
    end
  end

  def destroy
    @review.destroy
    flash[:success] = "Review deleted"
    redirect_to request.referrer || root_url
  end
  
  private

    def review_params
      params.require(:review).permit(:user_id, :reviewText, :rating_area, :rating_cleanliness, :rating_cost, :rating_landlord)
    end
    
    def correct_user
      @review = current_property.reviews.find_by(id: params[:id])
      redirect_to root_url if @review.nil?
    end
end
