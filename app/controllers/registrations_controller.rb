class RegistrationsController < ApplicationController

    def new
        @admin = Admin.new
    end

    def create
        @admin = Admin.new(admin_params)
        if @admin.save
            session[:admin_email] = @admin.email
            redirect_to events_path, notice: "Successfully created admin registration"
        else
            render :new
        end
    end

    def show
        @admin = Admin.find(params[:id])
    end

    private

    def admin_params
        params.require(:admin).permit(:name, :email, :password)
    end
end
