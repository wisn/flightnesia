json.extract! confirmation, :id, :booking_id, :jumlah_bayar, :pengirim, :nama_bank, :created_at, :updated_at
json.url confirmation_url(confirmation, format: :json)
