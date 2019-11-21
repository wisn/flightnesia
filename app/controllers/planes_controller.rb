class PlanesController < ApplicationController
  before_action :set_plane, only: [:show, :edit, :update, :destroy]

  # GET /planes
  # GET /planes.json
  def index
    redirect_if_not_logged_in

    @planes = Plane.all
    @title = 'Jadwal Pesawat'
  end

  # GET /planes/1
  # GET /planes/1.json
  # def show
  # end

  # GET /planes/new
  def new
    redirect_if_not_logged_in

    @plane = Plane.new
    @title = 'Tambah Jadwal'
  end

  # GET /planes/1/edit
  def edit
    redirect_if_not_logged_in

    @title = 'Edit Jadwal'
  end

  # POST /planes
  # POST /planes.json
  def create
    redirect_if_not_logged_in

    @plane = Plane.new(plane_params)

    respond_to do |format|
      if @plane.save
        # format.html { redirect_to @plane, notice: 'Plane was successfully created.' }
        format.html { redirect_to '/planes' }
        format.json { render :show, status: :created, location: @plane }
      else
        format.html { render :new }
        format.json { render json: @plane.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /planes/1
  # PATCH/PUT /planes/1.json
  def update
    redirect_if_not_logged_in

    respond_to do |format|
      if @plane.update(plane_params)
        # format.html { redirect_to @plane, notice: 'Plane was successfully updated.' }
        format.html { redirect_to '/planes' }
        format.json { render :show, status: :ok, location: @plane }
      else
        format.html { render :edit }
        format.json { render json: @plane.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planes/1
  # DELETE /planes/1.json
  def destroy
    redirect_if_not_logged_in

    @plane.destroy
    respond_to do |format|
      # format.html { redirect_to planes_url, notice: 'Plane was successfully destroyed.' }
      format.html { redirect_to '/planes' }
      format.json { head :no_content }
    end
  end

  def find
    @title = 'Cek Tiket'

    if request.post?
      params = find_params
      @tgl_berangkat = params[:tgl_berangkat]
      @planes = Plane.where bandara_asal: params[:bandara_asal], bandara_tujuan: params[:bandara_tujuan]
      flash[:planes] = @planes.all
      flash[:tgl_berangkat] = @tgl_berangkat

      redirect_to '/planes/result'
    end
  end

  def result
    @title = 'Info Pesawat'

    @planes = flash[:planes]
    flash[:planes] = @planes
    @tgl_berangkat = flash[:tgl_berangkat]
    flash[:tgl_berangkat] = @tgl_berangkat

    puts @planes
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plane
      @plane = Plane.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plane_params
      params.require(:plane).permit(:kode_pesawat, :nama_pesawat, :kelas, :bandara_asal, :bandara_tujuan, :jam_keberangkatan, :jam_kedatangan, :harga, :jml_kursi)
    end

    def find_params
      params.require(:plane).permit(:bandara_asal, :bandara_tujuan, :tgl_berangkat)
    end

    def redirect_if_not_logged_in
      redirect_to '/admin' if session[:user_data].nil?
    end
end
