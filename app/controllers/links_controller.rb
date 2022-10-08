class LinksController < ApplicationController
  def index
    @links = Link.all
    @sections = Link.sections
    @specificsection = Link.specsections
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to link_url(@link), notice: "Link was successfully created." }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    respond_to do |format|
        @link = Link.find(params[:id])
        if @link.update(link_params)
          format.html { redirect_to link_url(@link), notice: "Link was successfully updated." }
          format.json { render :show, status: :ok, location: @link }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @link.errors, status: :unprocessable_entity }
        end
      end
  end

  def delete
    @link=Link.find(params[:id])
  end

  def destroy
    @link=Link.find(params[:id])
    @link.destroy
    flash[:notice]="Link '#{@link.title}' deleted successfully."
    redirect_to(links_path)
  end

  private
      def link_params
        params.require(:link).permit(:title, :section, :link)
      end
end