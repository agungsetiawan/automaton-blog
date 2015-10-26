class CommentsController < ApplicationController

  def create
  	@article=Article.find_by_id(params[:article_id])
    @comment=Comment.new(comment_params)
    
    @comment.article_id=@article.id

    if @comment.save
      redirect_to articles_show_path(@article)
    else
      render 'articles/show'
    end
  end

  private
  def comment_params
  	params.require(:comment).permit(:author, :email, :content)
  end

end
