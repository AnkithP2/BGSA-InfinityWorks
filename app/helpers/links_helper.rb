# frozen_string_literal: true

# Helper for links
module LinksHelper
  def admin?
    return true if session[:admin_email]
  end
end
