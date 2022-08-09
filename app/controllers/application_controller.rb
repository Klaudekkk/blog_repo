class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in? #są dostepne dla widokow, bez tego by nie były

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #jezeli current_user nie istnieje to robi find a jezeli istnieje to juz go tworzy
  end

  def logged_in?
    !!current_user
    # !! zmienia zmienną current_user na bool czyli True False
  end

end
