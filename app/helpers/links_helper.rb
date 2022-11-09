# frozen_string_literal: true

# Helper for links
module LinksHelper
    def is_admin
        return true if session[:admin_email]
    end
end
