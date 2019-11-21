require "application_system_test_case"

class BookingsTest < ApplicationSystemTestCase
  setup do
    @booking = bookings(:one)
  end

  test "visiting the index" do
    visit bookings_url
    assert_selector "h1", text: "Bookings"
  end

  test "creating a Booking" do
    visit bookings_url
    click_on "New Booking"

    fill_in "Bandara asal", with: @booking.bandara_asal
    fill_in "Bandara tujuan", with: @booking.bandara_tujuan
    fill_in "Kode pesawat", with: @booking.kode_pesawat
    check "Konfirmasi" if @booking.konfirmasi
    fill_in "Nama", with: @booking.nama
    fill_in "Nama pesawat", with: @booking.nama_pesawat
    fill_in "No", with: @booking.no_id
    fill_in "No telp", with: @booking.no_telp
    fill_in "Tgl berangkat", with: @booking.tgl_berangkat
    click_on "Create Booking"

    assert_text "Booking was successfully created"
    click_on "Back"
  end

  test "updating a Booking" do
    visit bookings_url
    click_on "Edit", match: :first

    fill_in "Bandara asal", with: @booking.bandara_asal
    fill_in "Bandara tujuan", with: @booking.bandara_tujuan
    fill_in "Kode pesawat", with: @booking.kode_pesawat
    check "Konfirmasi" if @booking.konfirmasi
    fill_in "Nama", with: @booking.nama
    fill_in "Nama pesawat", with: @booking.nama_pesawat
    fill_in "No", with: @booking.no_id
    fill_in "No telp", with: @booking.no_telp
    fill_in "Tgl berangkat", with: @booking.tgl_berangkat
    click_on "Update Booking"

    assert_text "Booking was successfully updated"
    click_on "Back"
  end

  test "destroying a Booking" do
    visit bookings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Booking was successfully destroyed"
  end
end
