# frozen_string_literal: true

# This controller controls RSVPs CRUD and references
class RsvpsController < ApplicationController
  before_action :set_rsvp, only: %i[show edit update destroy]

  # GET /rsvps or /rsvps.json
  def index
    @admin = (Admin.find_by_email(session[:admin_email]) if session[:admin_email])

    if session[:admin_email]
      @rsvps = Rsvp.all
    else
      message = 'You need admin permissions'
      redirect_to(login_path, notice: message)
    end
  end

  # GET /rsvps/1 or /rsvps/1.json
  def show
    if session[:admin_email]
      @rsvp = Rsvp.find(params[:id])
    else
      message = 'You need admin permissions'
      redirect_to(login_path, notice: message)
    end
  end

  # GET /rsvps/new
  def new
    @rsvp = Rsvp.new
  end

  # GET /rsvps/1/edit
  def edit; end

  # POST /rsvps or /rsvps.json
  def create
    @rsvp = Rsvp.new(rsvp_params)
    # check for errors if none register user
    errors = Rsvp.error_checks(@rsvp)
    if errors.empty?
      respond_to do |format|
        if @rsvp.save
          format.html { redirect_to(events_path, notice: 'Rsvp was successfully created.') }
          format.json { render(:show, status: :created, location: @rsvp) }
        else
          format.html { render(:new, status: :unprocessable_entity) }
          format.json { render(json: @rsvp.errors, status: :unprocessable_entity) }
        end
      end
    else
      flash[:notice] = errors.join(' |  ').html_safe
      redirect_to(new_rsvp_path)
    end
  end

  # PATCH/PUT /rsvps/1 or /rsvps/1.json
  def update
    if session[:admin_email]
      respond_to do |format|
        if @rsvp.update(rsvp_params)
          format.html { redirect_to(rsvp_url(@rsvp), notice: 'Rsvp was successfully updated.') }
          format.json { render(:show, status: :ok, location: @rsvp) }
        else
          format.html { render(:edit, status: :unprocessable_entity) }
          format.json { render(json: @rsvp.errors, status: :unprocessable_entity) }
        end
      end
    else
      message = 'You need admin permissions'
      redirect_to(login_path, notice: message)
    end
  end

  def delete
    if session[:admin_email]
      @rsvp = Rsvp.find(params[:id])
    else
      message = 'You need admin permissions'
      redirect_to(login_path, notice: message)
    end
  end

  # DELETE /rsvps/1 or /rsvps/1.json
  def destroy
    if session[:admin_email]
      @rsvp = Rsvp.find(params[:id])
      @rsvp.destroy
      flash[:notice] = "rsvp '#{@rsvp.id}' deleted successfully."
      redirect_to(rsvps_path)
    else
      message = 'You need admin permissions'
      redirect_to(login_path, notice: message)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rsvp
    @rsvp = Rsvp.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def rsvp_params
    params.require(:rsvp).permit(:event_id, :userid, :rsvped)
  end
end
