require "application_system_test_case"

class PlanesTest < ApplicationSystemTestCase
  setup do
    @plane = planes(:one)
  end

  test "visiting the index" do
    visit planes_url
    assert_selector "h1", text: "Planes"
  end

  test "creating a Plane" do
    visit planes_url
    click_on "New Plane"

    fill_in "Bandara asal", with: @plane.bandara_asal
    fill_in "Bandara tujuan", with: @plane.bandara_tujuan
    fill_in "Harga", with: @plane.harga
    fill_in "Jam keberangkatan", with: @plane.jam_keberangkatan
    fill_in "Jam kedatangan", with: @plane.jam_kedatangan
    fill_in "Jml kursi", with: @plane.jml_kursi
    fill_in "Kelas", with: @plane.kelas
    fill_in "Kode pesawat", with: @plane.kode_pesawat
    fill_in "Nama pesawat", with: @plane.nama_pesawat
    click_on "Create Plane"

    assert_text "Plane was successfully created"
    click_on "Back"
  end

  test "updating a Plane" do
    visit planes_url
    click_on "Edit", match: :first

    fill_in "Bandara asal", with: @plane.bandara_asal
    fill_in "Bandara tujuan", with: @plane.bandara_tujuan
    fill_in "Harga", with: @plane.harga
    fill_in "Jam keberangkatan", with: @plane.jam_keberangkatan
    fill_in "Jam kedatangan", with: @plane.jam_kedatangan
    fill_in "Jml kursi", with: @plane.jml_kursi
    fill_in "Kelas", with: @plane.kelas
    fill_in "Kode pesawat", with: @plane.kode_pesawat
    fill_in "Nama pesawat", with: @plane.nama_pesawat
    click_on "Update Plane"

    assert_text "Plane was successfully updated"
    click_on "Back"
  end

  test "destroying a Plane" do
    visit planes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Plane was successfully destroyed"
  end
end
