class CommentsController < ApplicationController


  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to posts_path
      flash[:notice] = "コメントに成功しました"
    else
      redirect_to posts_path
      flash[:alert] = "コメントに失敗しました"
    end
  end

  def destroy
    @comment = Comment.find_by(params[:id])
    @comment.destroy
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
