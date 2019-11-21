# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_21_101955) do

  create_table "booking", primary_key: "Booking_id", id: :string, limit: 50, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "kode_kereta", limit: 10, null: false
    t.string "nama", limit: 100
    t.string "no_id", limit: 100, null: false
    t.string "jenis_id", limit: 100, null: false
    t.string "no_telp", limit: 100, null: false
    t.string "nama_kereta", limit: 100, null: false
    t.string "stasiun_awal", limit: 100, null: false
    t.string "stasiun_tujuan", limit: 100, null: false
    t.date "tgl_berangkat", null: false
    t.boolean "konfirmasi", null: false
    t.index ["Booking_id"], name: "Booking_id"
    t.index ["Booking_id"], name: "Booking_id_2", unique: true
  end

  create_table "bookings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "kode_pesawat"
    t.string "nama"
    t.string "no_id"
    t.string "no_telp"
    t.string "nama_pesawat"
    t.string "bandara_asal"
    t.string "bandara_tujuan"
    t.date "tgl_berangkat"
    t.boolean "konfirmasi"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "confirmations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "booking_id"
    t.string "jumlah_bayar"
    t.string "pengirim"
    t.string "nama_bank"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "datakereta", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "kode_kereta", limit: 10, null: false
    t.string "nama_kereta", limit: 100, null: false
    t.string "kelas", limit: 100, null: false
    t.string "stasiun_asal", limit: 100, null: false
    t.string "stasiun_tujuan", limit: 100, null: false
    t.time "jam_keberangkatan", null: false
    t.time "jam_kedatangan", null: false
    t.integer "harga", null: false
    t.integer "jmlkursi", null: false
  end

  create_table "konfirmasi", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "Booking_id", limit: 50, null: false
    t.string "jumlah", limit: 50, null: false
    t.string "pengirim", limit: 50, null: false
    t.string "nama_bank", limit: 50, null: false
  end

  create_table "pesawats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "kode_pesawat"
    t.string "nama_pesawat"
    t.string "kelas"
    t.string "bandara_asal"
    t.string "bandara_tujuan"
    t.time "jam_keberangkatan"
    t.time "jam_kedatangan"
    t.integer "harga"
    t.integer "jml_kursi"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "planes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "kode_pesawat"
    t.string "nama_pesawat"
    t.string "kelas"
    t.string "bandara_asal"
    t.string "bandara_tujuan"
    t.time "jam_keberangkatan"
    t.time "jam_kedatangan"
    t.integer "harga"
    t.integer "jml_kursi"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user", primary_key: "User_id", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "Firstname", limit: 100, null: false
    t.string "Lastname", limit: 100, null: false
    t.string "username", limit: 100, null: false
    t.string "password", limit: 100, null: false
    t.string "Address", limit: 100, null: false
    t.string "Town", limit: 100, null: false
    t.string "Country", limit: 100, null: false
    t.integer "Postcode", null: false
    t.string "Email", limit: 100, null: false
    t.index ["Firstname", "Lastname", "Address", "Town", "Country", "Postcode", "Email"], name: "Firstname"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "username"
    t.string "password"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
