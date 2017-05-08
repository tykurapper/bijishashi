module UsersHelper
  def gravatar_for(user)
    gravatar_url = "https://secure.gravatar.com/avatar/"
    image_tag(gravatar_url, alt: user.fullname, class: "gravatar")
  end
end
