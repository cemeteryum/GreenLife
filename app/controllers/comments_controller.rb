class CommentsController < ApplicationController
  
  def new
		@comment = Comment.new
	end
  def create
    @article = Article.find(params[:article_id])
    #@user = current_user
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.article = @article
    
     
    if @comment.save
			flash[:notice] = "Comment was succesfully created"
			redirect_to article_path(@article)
		else
		  flash[:notice] = "Error with your comment"
			redirect_to article_path(@article)
		end
  end
  
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
  
  private
		def comment_params
			params.require(:comment).permit(:body, :article_id, :user_id)
		end
end
