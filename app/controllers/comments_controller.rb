class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def create
    @user = User.find(current_user)
    @comment = current_property.comments.build(comment_params)
    if @comment.save
      redirect_to current_property
    else
      #flash[:danger] = "Comment not added please report this to the site admin."
      redirect_to current_property
    end
  end

  def destroy
    @comment.destroy
    redirect_to request.referrer || root_url
  end
  
  private

    def comment_params
      params.require(:comment).permit(:user_id, :content)
    end
    
    def correct_user
      @comment = current_property.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end
