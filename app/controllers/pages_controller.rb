class PagesController < ApplicationController
  def home
    redirect_to articles_path if logged_in? #jezeli zalogowany to mozesz isc do sciezki z artykulami
  end
  def about
  end
end
