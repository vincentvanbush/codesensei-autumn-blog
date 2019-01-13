class CommentsController < ApplicationController
  # TODO: Zdefiniować i wykorzystać abilities
  before_action :load_article

  # POST /articles/:article_id/comments
  # POST /articles/:article_id/pictures/:picture_id/comments
  def create
    # Sprawdźmy, czy przypadkiem nie powinniśmy tworzyć tu komentarza dla
    # obrazka artykułu, a nie całego artykułu
    if params[:picture_id].present?
      @picture = @article.pictures.find(params[:picture_id])
    end
    # Utwórzmy komentarz dla obrazka, jeśli z kontekstu wynika że wiemy co to za obrazek;
    # w przeciwnym razie utwórzmy go dla artykułu
    @comment = (@picture || @article).comments.new(comment_params)

    if @comment.save
      flash[:success] = t('comments.create.success')
      if @picture.present? # jeśli komentarz jest dla obrazka, przekieruj do obrazka
        redirect_to article_picture_path(@article.id, @picture.id)
      else # jeśli nie, przekieruj do artykułu
        redirect_to article_path(@article.id)
      end
    else # zapis nie powiódł się - błędy walidacji
      flash.now[:error] = t(
        'comments.create.error',
        problems: @comment.errors.full_messages.to_sentence
      )
      if @picture.present? # jeśli komentarz jest dla obrazka, pokaż z powrotem widok obrazka
        render 'pictures/show'
      else # w przeciwnym razie pokaż z powrotem widok artykułu
        render 'articles/show'
      end
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
