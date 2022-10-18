class SectionsController < ApplicationController
  def index
    @sections = Section.all
    if session[:admin_email]
      @admin = Admin.find_by_email(session[:admin_email])
    else  
      @admin = nil
    end
  end

  def show
    if session[:admin_email]
      @admin = Admin.find_by_email(session[:admin_email])
    else  
      @admin = nil
    end
    @section = Section.find(params[:id])
  end

  def new
    if(session[:admin_email])
      @section = Section.new
    else
      message = "You need admin permissions new"
      redirect_to login_path, notice: message
    end
  end

  def create
    if(session[:admin_email])
      @section = Section.new(section_params)

      respond_to do |format|
        if @section.save
          format.html { redirect_to section_url(@section), notice: "Section was successfully created." }
          format.json { render :show, status: :created, location: @section }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @section.errors, status: :unprocessable_entity }
        end
      end
    else
      message = "You need admin permissions create"
      redirect_to login_path, notice: message
    end
  end

  def edit
    if(session[:admin_email])
      @section = Section.find(params[:id])
    else
      message = "You need admin permissions edit"
      redirect_to login_path, notice: message
    end
  end

  def update
    respond_to do |format|
        @section = Section.find(params[:id])
        if @section.update(link_params)
          format.html { redirect_to link_url(@section), notice: "Link was successfully updated." }
          format.json { render :show, status: :ok, location: @section }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @section.errors, status: :unprocessable_entity }
        end
      end
  end

  def delete
    if(session[:admin_email])
      @section=Section.find(params[:id])
    else
      message = "You need admin permissions delete"
      redirect_to login_path, notice: message
    end
  end

  def destroy
    if(session[:admin_email])
      @section=Section.find(params[:id])
      @section.destroy
      flash[:notice]="Section '#{@section.label}' deleted successfully."
      redirect_to(sections_path)
    else
      message = "You need admin permissions destroy"
      redirect_to login_path, notice: message
    end
  end

  private
      def section_params
        params.require(:section).permit(:label)
      end
end