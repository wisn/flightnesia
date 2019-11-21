class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
    @title = 'Daftar Pemesanan Tiket'
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    kode_pesawat = @booking.kode_pesawat
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Pemesanan sudah dibatalkan' }
      format.json { head :no_content }

      @plane = Plane.find_by kode_pesawat: kode_pesawat
      @plane.jml_kursi += 1
      @plane.save
    end
  end

  def new_book
    @title = 'Booking Pesawat'

    code = params[:kode_pesawat]
    @plane = Plane.find_by kode_pesawat: code
    @tgl_berangkat = flash[:tgl_berangkat]
    flash[:tgl_berangkat] = @tgl_berangkat
  end

  def create_book
    params = create_book_params
    params[:konfirmasi] = false

    @booking = Booking.new params
    respond_to do |format|
      if @booking.save
        # format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        flash[:notice] = "Pemesanan dengan kode <b>#{Base64.encode64 @booking.id.to_s}</b> berhasil dibuat. "
        flash[:notice] += "Harap segera melakukan konfirmasi pembayaran."
        format.html { redirect_to "/confirmations/new" }
        format.json { render :show, status: :created, location: @booking }

        @plane = Plane.find_by kode_pesawat: params[:kode_pesawat]
        @plane.jml_kursi -= 1
        @plane.save
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm
    booking_id = (Base64.decode64 params[:booking_id]).to_i
    @booking = Booking.find booking_id
    @booking.konfirmasi = true
    @booking.save

    @confirmation = Confirmation.find_by booking_id: booking_id
    @confirmation.destroy

    flash[:notice] = 'Pembayaran sudah terkonfirmasi'
    redirect_to '/confirmations'
  end

  def status
    @title = 'Cek Kode Booking'
  end
  
  def check
    params = check_book_params
    booking_id = (Base64.decode64 params[:booking_id]).to_i

    @booking = Booking.find_by id: booking_id
    
    unless @booking.nil?
      redirect_to "/bookings/#{booking_id}"
    else
      flash[:notice] = 'Kode booking tidak ditemukan'
      redirect_to '/bookings/status'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:kode_pesawat, :nama, :no_id, :no_telp, :nama_pesawat, :bandara_asal, :bandara_tujuan, :tgl_berangkat, :konfirmasi)
    end

    def create_book_params
      params.require(:booking).permit(:kode_pesawat, :nama, :no_id, :no_telp, :nama_pesawat, :bandara_asal, :bandara_tujuan, :tgl_berangkat)
    end

    def check_book_params
      params.require(:booking).permit(:booking_id)
    end
end
