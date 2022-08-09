module ApplicationHelper

  def gravatar_for(user, option = {size:80})
    email_adress = user.email
    hash = Digest::MD5.hexdigest(email_adress)
    size = option[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: " is-justify-content-center")
  end
end

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #jezeli current_user nie istnieje to robi find a jezeli istnieje to juz go tworzy
end

def logged_in?
  !!current_user
  # !! zmienia zmienną current_user na bool czyli True False
end