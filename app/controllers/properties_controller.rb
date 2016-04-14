class PropertiesController < ApplicationController
  before_action :logged_in_user, only: [:new]
  before_action :correct_user,   only: []
  before_action :admin_user,     only: [:new]
  
  def index
    @properties = Property.paginate(page: params[:page])
  end
  
  def new
    @property = Property.new
    @user = User.find(current_user)
  end
  
  def show
    @property = Property.find(params[:id])
    @user = User.find(current_user)
  end
  
  def create 
    @property = Property.new(property_params)
    if @property.save 
      redirect_to root_url
    end  
    
  end
  
  def update 
    if @property.update_attributes(property_params)
      flash[:success] = "Property updated!"
    end
  end
  
  def destroy
    Property.find(params[:id]).destroy
    flash[:success] = "Property removed!"
    redirect_to root_url
  end
  
  private
  
    def property_params
      params.require(:property).permit(:addressLine1, :addressLine2,:country ,:town, :postcode)
    end
    
    #Before filters
    
    #Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    #Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  
end
