class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  # To cover if value on the database have defaults for forms
  # to fill in
  # create the form
  def new
    @user = User.new
  end

  # instantiate the form contents
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "user was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    respond_to do |format|
        @user = User.find(params[:id])
        if @user.update(user_params)
          format.html { redirect_to user_url(@user), notice: "user was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
  end

  def delete
    @user=User.find(params[:id])
  end

  def destroy
    @user=User.find(params[:id])
    @user.destroy
    flash[:notice]="user '#{@user.id}' deleted successfully."
    redirect_to(users_path)
  end

  private

      # Use callbacks to shcare common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:firstname, :lastname, :userpoints, :usertotal)
      end
  

end
