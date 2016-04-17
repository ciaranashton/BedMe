class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  
  def create
    @user = User.find(current_user)
    property = Property.find_by(id: params[:property_id])
    
    @comment = property.comments.create!(user_id: @user.id, content: "Content")
    if @comment.save
      flash[:success] = "Comment Added"
      redirect_to root_url
    else
      render 'pages/home'
    end
  end

  def destroy
  end
  
  private

    def comment_params
      params.require(:micropost).permit(:content)
    end
end
