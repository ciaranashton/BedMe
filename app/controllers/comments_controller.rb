class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  
  def create
    @user = User.find(current_user)
    @comment = current_property.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment Added"
      redirect_to current_property
    else
      flash[:danger] = "Comment not added please report this to the site admin."
      redirect_to current_property
    end
  end

  def destroy
  end
  
  private

    def comment_params
      params.require(:comment).permit(:user_id, :content)
    end
end
