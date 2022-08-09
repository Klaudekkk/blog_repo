module ApplicationHelper

  def gravatar_for(user, option = {size:80})
    email_adress = user.email
    hash = Digest::MD5.hexdigest(email_adress)
    size = option[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: " is-justify-content-center")
  end
end

