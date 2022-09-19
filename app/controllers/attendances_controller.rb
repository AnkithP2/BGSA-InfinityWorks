class AttendancesController < ApplicationController
  def index
    @attendances = Attendance.all
  end

  def show
    @attendance = Attendance.find(params[:id])
  end

  # To cover if value on the database have defaults for forms
  # to fill in
  # create the form
  def new
    @attendance = Attendance.new
  end

  # instantiate the form contents
  def create
    @attendance = Attendance.new(attendance_params)

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to attendance_url(@attendance), notice: "attendance was successfully created." }
        format.json { render :show, status: :created, location: @attendance }
        begin
          user = User.find(@attendance.userid)
        rescue ActiveRecord::RecordNotFound
          user = User.new(firstname: "John", lastname: "Smith", userpoints: 0, usertotal: 0)
          user.save
        ensure
          event = Event.find(@attendance.event_id)
          user.userpoints = user.userpoints + event.eventpoints
          user.usertotal = user.usertotal + event.eventpoints
          user.save
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @attendance = Attendance.find(params[:id])
  end

  def update
    respond_to do |format|
        @attendance = Attendance.find(params[:id])
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
    @attendance=Attendance.find(params[:id])
  end

  def destroy
    @attendance=Attendance.find(params[:id])
    @attendance.destroy
    flash[:notice]="attendance '#{@attendance.id}' deleted successfully."
    redirect_to(attendances_path)
  end

  private
      # Only allow a list of trusted parameters through.
      def attendance_params
        params.require(:attendance).permit(:event_id, :userid, :signup, :attended)
      end
end