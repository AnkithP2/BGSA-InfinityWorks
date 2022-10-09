class SessionsController < ApplicationController

    def create
        @admin = Admin.find_by(email: params[:email])

        if !!@admin && @admin.authenticate(params[:password])
            session[:admin_id] = @admin.id
            redirect_to events_path
        else 
            message = "You need admin permissions"
            redirect_to login_path, notice: message

        end
    end

    def destroy
        session[:admin_id] = nil
        redirect_to events_path

    end

end
