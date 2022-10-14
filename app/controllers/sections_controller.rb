class SectionsController < ApplicationController
  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
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
  end

  def edit
    @section = Section.find(params[:id])
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
    @section=Section.find(params[:id])
  end

  def destroy
    @section=Section.find(params[:id])
    @section.destroy
    flash[:notice]="Section '#{@section.label}' deleted successfully."
    redirect_to(sections_path)
  end

  private
      def section_params
        params.require(:section).permit(:label)
      end
end