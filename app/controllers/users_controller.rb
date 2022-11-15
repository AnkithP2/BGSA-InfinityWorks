# frozen_string_literal: true

# This controller controls User login, CRUD, and references
class UsersController < ApplicationController
  def index
    @users = User.all
    @admin = (Admin.find_by_email(session[:admin_email]) if session[:admin_email])
  end

  def show
    @user = User.find(params[:id])
    @admin = (Admin.find_by_email(session[:admin_email]) if session[:admin_email])
  end

  # To cover if value on the database have defaults for forms
  # to fill in
  # create the form
  def new
    if session[:admin_email]
      @user = User.new
    else
      message = 'You need admin permissions to make a new user'
      redirect_to(login_path, notice: message)
    end
  end

  # instantiate the form contents
  def create
    if session[:admin_email]
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to(user_url(@user), notice: 'user was successfully created.') }
          format.json { render(:show, status: :created, location: @user) }
        else
          format.html { render(:new, status: :unprocessable_entity) }
          format.json { render(json: @user.errors, status: :unprocessable_entity) }
        end
      end
    else
      message = 'You need admin permissions to create'
      redirect_to(login_path, notice: message)
    end
  end

  def edit
    if session[:admin_email]
      @user = User.find(params[:id])
    else
      message = 'You need admin permissions to edit'
      redirect_to(login_path, notice: message)
    end
  end

  def update
    respond_to do |format|
      @user = User.find(params[:id])
      if @user.update(user_params)
        format.html { redirect_to(user_url(@user), notice: 'user was successfully updated.') }
        format.json { render(:show, status: :ok, location: @user) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @user.errors, status: :unprocessable_entity) }
      end
    end
  end

  def delete
    if session[:admin_email]
      @user = User.find(params[:id])
    else
      message = 'You need admin permissions to delete'
      redirect_to(login_path, notice: message)
    end
  end

  def destroy
    if session[:admin_email]
      @user = User.find(params[:id])
      @user.destroy
      flash[:notice] = "user '#{@user.id}' deleted successfully."
      redirect_to(users_path)
    else
      message = 'You need admin permissions to destroy'
      redirect_to(login_path, notice: message)
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:firstname, :lastname, :userpoints, :usertotal)
  end
end
