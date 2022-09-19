class AdminSecuritiesController < ApplicationController
  before_action :set_admin_security, only: %i[ show edit update destroy ]

  # GET /admin_securities or /admin_securities.json
  def index
    @admin_securities = AdminSecurity.all
  end

  # GET /admin_securities/1 or /admin_securities/1.json
  def show
  end

  # GET /admin_securities/new
  def new
    @admin_security = AdminSecurity.new
  end

  # GET /admin_securities/1/edit
  def edit
  end

  # POST /admin_securities or /admin_securities.json
  def create
    @admin_security = AdminSecurity.new(admin_security_params)

    respond_to do |format|
      if @admin_security.save
        format.html { redirect_to admin_security_url(@admin_security), notice: "Admin security was successfully created." }
        format.json { render :show, status: :created, location: @admin_security }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_security.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin_securities/1 or /admin_securities/1.json
  def update
    respond_to do |format|
      if @admin_security.update(admin_security_params)
        format.html { redirect_to admin_security_url(@admin_security), notice: "Admin security was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_security }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_security.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_securities/1 or /admin_securities/1.json
  def destroy
    @admin_security.destroy

    respond_to do |format|
      format.html { redirect_to admin_securities_url, notice: "Admin security was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_security
      @admin_security = AdminSecurity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_security_params
      params.require(:admin_security).permit(:last_login)
    end
end
