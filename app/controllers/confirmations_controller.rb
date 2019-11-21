class ConfirmationsController < ApplicationController
  before_action :set_confirmation, only: [:show, :edit, :update, :destroy]

  # GET /confirmations
  # GET /confirmations.json
  def index
    redirect_if_not_logged_in

    @confirmations = Confirmation.all
    @title = 'Daftar Permintaan Konfirmasi'
  end

  # GET /confirmations/1
  # GET /confirmations/1.json
  def show
    redirect_if_not_logged_in
  end

  # GET /confirmations/new
  def new
    @confirmation = Confirmation.new
    @title = 'Konfirmasi Pembayaran'
  end

  # GET /confirmations/1/edit
  def edit
    redirect_if_not_logged_in
  end

  # POST /confirmations
  # POST /confirmations.json
  def create
    params = confirmation_params
    params[:booking_id] = (Base64.decode64 params[:booking_id]).to_i
    @confirmation = Confirmation.new(params)

    respond_to do |format|
      if @confirmation.save
        format.html { redirect_to '/confirmations/new', notice: 'Permintaan konfirmasi terkirim.' }
        format.json { render :show, status: :created, location: @confirmation }
      else
        format.html { render :new }
        format.json { render json: @confirmation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /confirmations/1
  # PATCH/PUT /confirmations/1.json
  def update
    redirect_if_not_logged_in

    respond_to do |format|
      if @confirmation.update(confirmation_params)
        format.html { redirect_to @confirmation, notice: 'Confirmation was successfully updated.' }
        format.json { render :show, status: :ok, location: @confirmation }
      else
        format.html { render :edit }
        format.json { render json: @confirmation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /confirmations/1
  # DELETE /confirmations/1.json
  def destroy
    redirect_if_not_logged_in
\
    @confirmation.destroy
    respond_to do |format|
      format.html { redirect_to confirmations_url, notice: 'Confirmation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_confirmation
      @confirmation = Confirmation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def confirmation_params
      params.require(:confirmation).permit(:booking_id, :jumlah_bayar, :pengirim, :nama_bank)
    end

    def redirect_if_not_logged_in
      redirect_to '/admin' if session[:user_data].nil?
    end
end
