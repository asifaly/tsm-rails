require "application_system_test_case"

class BidStatusesTest < ApplicationSystemTestCase
  setup do
    @bid_status = bid_statuses(:one)
  end

  test "visiting the index" do
    visit bid_statuses_url
    assert_selector "h1", text: "Bid Statuses"
  end

  test "creating a Bid status" do
    visit bid_statuses_url
    click_on "New Bid Status"

    fill_in "Name", with: @bid_status.name
    click_on "Create Bid status"

    assert_text "Bid status was successfully created"
    assert_selector "h1", text: "Bid Statuses"
  end

  test "updating a Bid status" do
    visit bid_status_url(@bid_status)
    click_on "Edit", match: :first

    fill_in "Name", with: @bid_status.name
    click_on "Update Bid status"

    assert_text "Bid status was successfully updated"
    assert_selector "h1", text: "Bid Statuses"
  end

  test "destroying a Bid status" do
    visit edit_bid_status_url(@bid_status)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Bid status was successfully destroyed"
  end
end
