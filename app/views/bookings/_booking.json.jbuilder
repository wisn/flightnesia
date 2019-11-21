json.extract! booking, :id, :kode_pesawat, :nama, :no_id, :no_telp, :nama_pesawat, :bandara_asal, :bandara_tujuan, :tgl_berangkat, :konfirmasi, :created_at, :updated_at
json.url booking_url(booking, format: :json)
