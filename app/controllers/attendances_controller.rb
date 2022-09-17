class AttendancesController < ApplicationController
  def index
    @attendances = attendance.all
  end

  def show
    @attendance = attendance.find(params[:id])
  end

  # To cover if value on the database have defaults for forms
  # to fill in
  # create the form
  def new
    @attendance = attendance.new
  end

  # instantiate the form contents
  def create
    @attendance = attendance.new(attendance_params)

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to attendance_url(@attendance), notice: "attendance was successfully created." }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @attendance = attendance.find(params[:id])
  end

  def update
    respond_to do |format|
        @attendance = attendance.find(params[:id])
        if @attendance.update(attendance_params)
          format.html { redirect_to attendance_url(@attendance), notice: "attendance was successfully updated." }
          format.json { render :show, status: :ok, location: @attendance }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @attendance.errors, status: :unprocessable_entity }
        end
      end
  end

  def delete
    @attendance=attendance.find(params[:id])
  end

  def destroy
    @attendance=attendance.find(params[:id])
    @attendance.destroy
    flash[:notice]="attendance '#{@attendance.title}' deleted successfully."
    redirect_to(attendances_path)
  end

  private
      # Only allow a list of trusted parameters through.
      def attendance_params
        params.require(:attendance).permit(:title, :date, :starttime, :endtime, :logincode, :location, :attendancepoints)
      end
end