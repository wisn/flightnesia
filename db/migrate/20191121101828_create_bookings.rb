class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :kode_pesawat
      t.string :nama
      t.string :no_id
      t.string :no_telp
      t.string :nama_pesawat
      t.string :bandara_asal
      t.string :bandara_tujuan
      t.date :tgl_berangkat
      t.boolean :konfirmasi

      t.timestamps
    end
  end
end
