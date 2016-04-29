class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @user = User.find(current_user)
    @review = Review.new(review_params)
    property = Property.find(@review.property_id)
    if @review.save!
      redirect_to property
    else
      flash[:danger] = "Review not added please report this to the site admin."
      redirect_to property
    end
  end
  
  def new
    @property = Property.find(current_property)
    @user = User.find(current_user)
    @review = Review.new
  end
  
  def current_property
    @current_property ||= Property.find_by(params[:id])
  end
  
  def destroy
    @review = Review.find(params[:id])
    @property = Property.find(@review.property_id)
    @review.destroy
    redirect_to @property
  end
  
  private
    def review_params
      params.require(:review).permit(:user_id, :reviewText, :reviewTitle, :rating_area,
                                     :rating_cost, :rating_cleanliness,
                                     :rating_landlord, :property_id)
    end
    
    def correct_user
      @review = Review.find(params[:id])
      puts @review
      redirect_to root_url if @review.nil?
    end
end
