module UsersHelper
  def gravatar_for(user, size: 80, cl: "gravatar")
    # rubocop:disable all
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    # rubocop:enable all
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: cl)
  end
end
