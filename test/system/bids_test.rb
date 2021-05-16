require "application_system_test_case"

class BidsTest < ApplicationSystemTestCase
  setup do
    @bid = bids(:one)
  end

  test "visiting the index" do
    visit bids_url
    assert_selector "h1", text: "Bids"
  end

  test "creating a Bid" do
    visit bids_url
    click_on "New Bid"

    fill_in "Account", with: @bid.account_id
    fill_in "Base rate", with: @bid.base_rate_id
    fill_in "Bid amount", with: @bid.bid_amount
    fill_in "Bid status", with: @bid.bid_status_id
    fill_in "Bid validity", with: @bid.bid_validity
    fill_in "Offer", with: @bid.offer_id
    fill_in "Rate", with: @bid.rate
    fill_in "Spread", with: @bid.spread
    click_on "Create Bid"

    assert_text "Bid was successfully created"
    assert_selector "h1", text: "Bids"
  end

  test "updating a Bid" do
    visit bid_url(@bid)
    click_on "Edit", match: :first

    fill_in "Account", with: @bid.account_id
    fill_in "Base rate", with: @bid.base_rate_id
    fill_in "Bid amount", with: @bid.bid_amount
    fill_in "Bid status", with: @bid.bid_status_id
    fill_in "Bid validity", with: @bid.bid_validity
    fill_in "Offer", with: @bid.offer_id
    fill_in "Rate", with: @bid.rate
    fill_in "Spread", with: @bid.spread
    click_on "Update Bid"

    assert_text "Bid was successfully updated"
    assert_selector "h1", text: "Bids"
  end

  test "destroying a Bid" do
    visit edit_bid_url(@bid)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Bid was successfully destroyed"
  end
end
