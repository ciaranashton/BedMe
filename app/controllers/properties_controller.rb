class PropertiesController < ApplicationController
  
  def index
    @properties = Property.all
  end
  
  def new
    @property = Property.new
  end
  
  def show
    @property = Property.find(params[:id])
  end
  
  def create 
    @property = Property.new(property_params)
    if @user.admin?
      if @property.save 
        flash[:success] = "Property created!"
      end  
    else 
      flash[:failure] = "Only admins can create properties!"
    end
    
  end
  
  def update 
    if @user.admin?
      if @property.update_attributes(property_params)
        flash[:success] = "Property updated!"
      end
    else 
      flash[:failure] = "Only admins can create properties!"
    end
  end
  
  def destroy
    if @user.admin?
      Property.find(params[:id]).destroy
      flash[:success] = "Property removed!"
      redirect_to root_url
    else
      flash[:failure] = "Only admins can delete properties"
    end
  end
  
  private
  
    def property_params
      params.require(:property).permit(:addressLine1, :addressLine2, :town, :postcode)
    end
  
end
