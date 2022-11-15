# frozen_string_literal: true

# This controller controls Events CRUD and references
class EventsController < ApplicationController
  def index
    @events = Event.all

    # finds all the meetings based on events to display in the simple_calendar
    @meetings = Event.where(
      starttime: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week
    )
    # sets up the admin cookie

    @admin = (Admin.find_by_email(session[:admin_email]) if session[:admin_email])

    @color = true
  end

  def show
    @admin = (Admin.find_by_email(session[:admin_email]) if session[:admin_email])

    @event = Event.find(params[:id])
    @rsvp = Rsvp.where(event_id: @event.id)
    @attendance = Attendance.where(event_id: @event.id)

    # finds the users that rsvp to an event
    @users_rsvp = []
    @rsvp.each do |rsvp|
      @users_rsvp.push(rsvp.user_id)
    end

    # finds users that attended an event
    @users_attend = []
    @attendance.each do |rsvp|
      @users_attend.push(rsvp.user_id)
    end
    # show rsvps for this specific event
  end

  # To cover if value on the database have defaults for forms
  # to fill in
  # create the form
  def new
    @admin = (Admin.find_by_email(session[:admin_email]) if session[:admin_email])
    if session[:admin_email]
      @event = Event.new
    else
      message = 'You need admin permissions new'
      redirect_to(login_path, notice: message)
    end
  end

  # instantiate the form contents
  def create
    # protects non-admins from creating an event
    if session[:admin_email]
      @event = Event.new(event_params)

      respond_to do |format|
        if @event.save
          format.html { redirect_to(event_url(@event), notice: 'Event was successfully created.') }
          format.json { render(:show, status: :created, location: @event) }
        else
          format.html { render(:new, status: :unprocessable_entity) }
          format.json { render(json: @event.errors, status: :unprocessable_entity) }
        end
      end
    else
      message = 'You need admin permissions create'
      redirect_to(login_path, notice: message)
    end
  end

  def edit
    if session[:admin_email]
      @event = Event.find(params[:id])
    else
      message = 'You need admin permissions edit'
      redirect_to(login_path, notice: message)
    end
  end

  def update
    respond_to do |format|
      @event = Event.find(params[:id])
      if @event.update(event_params)
        format.html { redirect_to(event_url(@event), notice: 'Event was successfully updated.') }
        format.json { render(:show, status: :ok, location: @event) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @event.errors, status: :unprocessable_entity) }
      end
    end
  end

  def delete
    if session[:admin_email]
      @event = Event.find(params[:id])
    else
      message = 'You need admin permissions delete'
      redirect_to(login_path, notice: message)
    end
  end

  def destroy
    if session[:admin_email]
      @event = Event.find(params[:id])
      @event.destroy
      flash[:notice] = "Event '#{@event.title}' deleted successfully."
      redirect_to(events_path)
    else
      message = 'You need admin permissions destroy'
      redirect_to(login_path, notice: message)
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :date, :starttime, :endtime, :logincode, :location, :eventpoints)
  end
end
