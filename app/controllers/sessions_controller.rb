class SessionsController < ApplicationController

    def create
        @admin = admin.find_by(email: params[:email])

        if !!@admin && @admin.authenticate(params[:password])
            session[:admin_id] = @admin.id
            redirect_to admin_path
        else 
            message = "You need admin permissions"
            redirect_to login_path, notice: message

        end
    end
end
