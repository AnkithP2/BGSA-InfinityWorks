# frozen_string_literal: true

# This controller controls admin sessions references
class SessionsController < ApplicationController
  def create
    @admin = Admin.find_by(email: params[:email])
    if !@admin.nil? && @admin.authenticate(params[:password])
      session[:admin_email] = @admin.email
      redirect_to(events_path)
    else
      message = 'Could not find admin'
      redirect_to(login_path, notice: message)
    end
  end

  def destroy
    session[:admin_email] = nil
    redirect_to(events_path)
  end
end
