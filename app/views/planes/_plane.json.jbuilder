json.extract! plane, :id, :kode_pesawat, :nama_pesawat, :kelas, :bandara_asal, :bandara_tujuan, :jam_keberangkatan, :jam_kedatangan, :harga, :jml_kursi, :created_at, :updated_at
json.url plane_url(plane, format: :json)
