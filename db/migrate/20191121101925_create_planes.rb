class CreatePlanes < ActiveRecord::Migration[6.0]
  def change
    create_table :planes do |t|
      t.string :kode_pesawat
      t.string :nama_pesawat
      t.string :kelas
      t.string :bandara_asal
      t.string :bandara_tujuan
      t.time :jam_keberangkatan
      t.time :jam_kedatangan
      t.integer :harga
      t.integer :jml_kursi

      t.timestamps
    end
  end
end
