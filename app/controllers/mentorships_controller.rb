# frozen_string_literal: true

# This controller controls mentorship CRUD and references
class MentorshipsController < ApplicationController
  before_action :set_mentorship, only: %i[show edit update destroy]

  # GET /mentorships or /mentorships.json
  def index
    @mentorships = Mentorship.all
  end

  # GET /mentorships/1 or /mentorships/1.json
  def show
    @mentorship = Mentorship.find(params[:id])
  end

  # GET /mentorships/new
  def new
    @mentorship = Mentorship.new
  end

  # GET /mentorships/1/edit
  def edit
    @mentorship = Mentorship.find(params[:id])
  end

  # POST /mentorships or /mentorships.json
  def create
    @mentorship = Mentorship.new(mentorship_params)

    respond_to do |format|
      if @mentorship.save
        format.html { redirect_to mentorship_url(@mentorship), notice: 'Mentorship was successfully created.' }
        format.json { render :show, status: :created, location: @mentorship }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mentorship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mentorships/1 or /mentorships/1.json
  def update
    respond_to do |format|
      if @mentorship.update(mentorship_params)
        format.html { redirect_to mentorship_url(@mentorship), notice: 'Mentorship was successfully updated.' }
        format.json { render :show, status: :ok, location: @mentorship }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mentorship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mentorships/1 or /mentorships/1.json
  def destroy
    @mentorship.destroy

    respond_to do |format|
      format.html { redirect_to mentorships_url, notice: 'Mentorship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mentorship
    @mentorship = Mentorship.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def mentorship_params
    params.require(:mentorship).permit(:mentor_id, :mentee_id)
  end
end
