# frozen_string_literal: true

# This controller controls attendance CRUD and references
class AttendancesController < ApplicationController
  def index
    @admin = (Admin.find_by_email(session[:admin_email]) if session[:admin_email])
    if session[:admin_email]
      @attendances = Attendance.all
    else
      message = 'You need admin permissions'
      redirect_to(login_path, notice: message)
    end
  end

  def show
    if session[:admin_email]
      @attendance = Attendance.find(params[:id])
    else
      message = 'You need admin permissions'
      redirect_to(login_path, notice: message)
    end
  end

  # To cover if valuecreateAdmin on the database have defaults for forms
  # to fill in
  # create the form
  def new
    @admin = (Admin.find_by_email(session[:admin_email]) if session[:admin_email])
    @attendance = Attendance.new
  end

  # instantiate the form contents
  def create
    @attendance = Attendance.new(attendance_params)
    # check for errors if none register user
    errors = Attendance.error_checks(@attendance)
    if errors.empty?
      respond_to do |format|
        if @attendance.save
          format.html { redirect_to(events_path, notice: 'attendance was successfully created.') }
          format.json { render(:show, status: :created, location: @attendance) }

          # user will always be found since the check for this already exists within the model
          # there was an ensure here that I removed to get the app working -sullivan
          Attendance.add_points(@attendance.event_id, @attendance.userid)

        else
          format.html { render(:new, status: :unprocessable_entity) }
          format.json { render(json: @attendance.errors, status: :unprocessable_entity) }
        end
      end
    else
      flash[:notice] = errors.join(' |  ').sanitize
      redirect_to(new_attendance_path)
    end
  end

  def edit
    if session[:admin_email]
      @attendance = Attendance.find(params[:id])
    else
      message = 'You need admin permissions'
      redirect_to(login_path, notice: message)
    end
  end

  def update
    if session[:admin_email]
      respond_to do |format|
        @attendance = Attendance.find(params[:id])
        if @attendance.update(attendance_params)
          format.html { redirect_to(attendance_url(@attendance), notice: 'attendance was successfully updated.') }
          format.json { render(:show, status: :ok, location: @attendance) }
        else
          format.html { render(:edit, status: :unprocessable_entity) }
          format.json { render(json: @attendance.errors, status: :unprocessable_entity) }
        end
      end
    else
      message = 'You need admin permissions'
      redirect_to(login_path, notice: message)
    end
  end

  def delete
    if session[:admin_email]
      @attendance = Attendance.find(params[:id])
    else
      message = 'You need admin permissions'
      redirect_to(login_path, notice: message)
    end
  end

  def destroy
    if session[:admin_email]
      @attendance = Attendance.find(params[:id])
      @attendance.destroy!
      flash[:notice] = "attendance '#{@attendance.id}' deleted successfully."
      redirect_to(attendances_path)
    else
      message = 'You need admin permissions'
      redirect_to(login_path, notice: message)
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def attendance_params
    params.require(:attendance).permit(:event_id, :userid, :password)
  end
end
