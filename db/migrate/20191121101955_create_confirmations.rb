class CreateConfirmations < ActiveRecord::Migration[6.0]
  def change
    create_table :confirmations do |t|
      t.integer :booking_id
      t.string :jumlah_bayar
      t.string :pengirim
      t.string :nama_bank

      t.timestamps
    end
  end
end
