class AdminController < ApplicationController

    def new
        @admin = Admin.new
    end

    def create
        @admin = Admin.new(admin_params)
        if @admin.save
            session[:admin_id] = @admin.id
            redirect_to root_path
        else
            render :new
        end
    end

    def show
        @admin = Admin.find(params[:id])
    end

    private

    def admin_params
        params.require(:admin).permit(:email, :password)
    end
end
