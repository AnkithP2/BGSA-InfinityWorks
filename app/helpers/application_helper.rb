# frozen_string_literal: true

# Helper for application
module ApplicationHelper
  def logged_in?
    !!session[:admin_email]
  end

  def current_admin
    @current_admin ||= admin.find_by(email: session[:admin_email]) if !!session[:admin_email]
  end
end
