require "application_system_test_case"

class ConfirmationsTest < ApplicationSystemTestCase
  setup do
    @confirmation = confirmations(:one)
  end

  test "visiting the index" do
    visit confirmations_url
    assert_selector "h1", text: "Confirmations"
  end

  test "creating a Confirmation" do
    visit confirmations_url
    click_on "New Confirmation"

    fill_in "Booking", with: @confirmation.booking_id
    fill_in "Jumlah bayar", with: @confirmation.jumlah_bayar
    fill_in "Nama bank", with: @confirmation.nama_bank
    fill_in "Pengirim", with: @confirmation.pengirim
    click_on "Create Confirmation"

    assert_text "Confirmation was successfully created"
    click_on "Back"
  end

  test "updating a Confirmation" do
    visit confirmations_url
    click_on "Edit", match: :first

    fill_in "Booking", with: @confirmation.booking_id
    fill_in "Jumlah bayar", with: @confirmation.jumlah_bayar
    fill_in "Nama bank", with: @confirmation.nama_bank
    fill_in "Pengirim", with: @confirmation.pengirim
    click_on "Update Confirmation"

    assert_text "Confirmation was successfully updated"
    click_on "Back"
  end

  test "destroying a Confirmation" do
    visit confirmations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Confirmation was successfully destroyed"
  end
end
