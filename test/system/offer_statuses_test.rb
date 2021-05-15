require "application_system_test_case"

class OfferStatusesTest < ApplicationSystemTestCase
  setup do
    @offer_status = offer_statuses(:one)
  end

  test "visiting the index" do
    visit offer_statuses_url
    assert_selector "h1", text: "Offer Statuses"
  end

  test "creating a Offer status" do
    visit offer_statuses_url
    click_on "New Offer Status"

    fill_in "Name", with: @offer_status.name
    click_on "Create Offer status"

    assert_text "Offer status was successfully created"
    assert_selector "h1", text: "Offer Statuses"
  end

  test "updating a Offer status" do
    visit offer_status_url(@offer_status)
    click_on "Edit", match: :first

    fill_in "Name", with: @offer_status.name
    click_on "Update Offer status"

    assert_text "Offer status was successfully updated"
    assert_selector "h1", text: "Offer Statuses"
  end

  test "destroying a Offer status" do
    visit edit_offer_status_url(@offer_status)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Offer status was successfully destroyed"
  end
end
