class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    #inicjujemy ją najpierw, aby przy załadowaniu
    # strony z formularzem można było wyłapyywać błedy w walidacji
  end

  def edit
  end

  def create
    # cały obiekt JSON zawarty jest w @article
    @article = Article.new(article_params) #require(:article) odnosi się do scope
    if @article.save
      flash[:notice]= "artykul zapisany z sukcesem"
      redirect_to @article #taki sam efekt article_path @article (article w path to nazwa prefixu z konsoli)
    else
      render 'new' #wyswietli na nowy form z inputami
    end
  end

  def update

    if @article.update(article_params)
      flash[:notice] = "zaktualizowano"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private #najlepiej na koncu dawac bo to co pod spodem jest wtedy private
  def set_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :description)
  end


end