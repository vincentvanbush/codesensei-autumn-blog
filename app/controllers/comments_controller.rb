class CommentsController < ApplicationController
  before_action :load_article

  # GET /articles/:article_id/comments
  def create
    @comment = @article.comments.new(comment_params)
    if @comment.save
      flash[:success] = t('comments.create.success')
      redirect_to article_path(@article.id)
    else
      flash.now[:error] = t(
        'comments.create.error',
        problems: @article.errors.full_messages.to_sentence
      )
      render 'articles/show'
    end
  end

  # GET /articles/:article_id/comments/:id/edit
  def edit
  end

  # PUT/PATCH /articles/:article_id/comments/:id
  def update
  end

  # DELETE /articles/:article_id/comments/:id
  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def load_article
    @article = Article.find(params[:article_id])
  end
end
