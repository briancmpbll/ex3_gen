# Helper functions for the Users controller
module UsersHelper
  # Returns a gravatar for the given user.
  def gravatar_for(user, size = 80)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.email, class: 'gravatar')
  end

  # Returns the string to show on the form button depending on the action.
  def submit_text
    edit_action? ? 'Save changes' : 'Create my account'
  end
end
