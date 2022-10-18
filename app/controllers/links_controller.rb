# frozen_string_literal: true

# This controller controls links CRUD and references
class LinksController < ApplicationController
  def index
    @links = Link.all
    @sections = Section.includes(:links).all
    @admin = (Admin.find_by_email(session[:admin_email]) if session[:admin_email])
  end

  def show
    @admin = (Admin.find_by_email(session[:admin_email]) if session[:admin_email])
    @link = Link.find(params[:id])
  end

  def new
    if session[:admin_email]
      @link = Link.new
    else
      message = 'You need admin permissions new'
      redirect_to login_path, notice: message
    end
  end

  def create
    if session[:admin_email]
      @link = Link.new(link_params)

      respond_to do |format|
        if @link.save
          format.html { redirect_to link_url(@link), notice: 'Link was successfully created.' }
          format.json { render :show, status: :created, location: @link }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @link.errors, status: :unprocessable_entity }
        end
      end
    else
      message = 'You need admin permissions create'
      redirect_to login_path, notice: message
    end
  end

  def edit
    if session[:admin_email]
      @link = Link.find(params[:id])
    else
      message = 'You need admin permissions edit'
      redirect_to login_path, notice: message
    end
  end

  def update
    respond_to do |format|
      @link = Link.find(params[:id])
      if @link.update(link_params)
        format.html { redirect_to link_url(@link), notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    if session[:admin_email]
      @link = Link.find(params[:id])
    else
      message = 'You need admin permissions delete'
      redirect_to login_path, notice: message
    end
  end

  def destroy
    if session[:admin_email]
      @link = Link.find(params[:id])
      @link.destroy
      flash[:notice] = "Link '#{@link.title}' deleted successfully."
      redirect_to(links_path)
    else
      message = 'You need admin permissions destroy'
      redirect_to login_path, notice: message
    end
  end

  private

  def link_params
    params.require(:link).permit(:section_id, :title, :link)
  end
end
