require "application_system_test_case"

class OffersTest < ApplicationSystemTestCase
  setup do
    @offer = offers(:one)
  end

  test "visiting the index" do
    visit offers_url
    assert_selector "h1", text: "Offers"
  end

  test "creating a Offer" do
    visit offers_url
    click_on "New Offer"

    fill_in "Account", with: @offer.account_id
    fill_in "Base rate", with: @offer.base_rate_id
    fill_in "Currency", with: @offer.currency_id
    check "Disclosed" if @offer.disclosed
    fill_in "Expiry date", with: @offer.expiry_date
    fill_in "Final destination", with: @offer.final_destination
    fill_in "Fixed rate", with: @offer.fixed_rate
    check "Open offer" if @offer.open_offer
    fill_in "Percentage sold", with: @offer.percentage_sold
    fill_in "Place of taking incharge", with: @offer.place_of_taking_incharge
    fill_in "Port of discharge", with: @offer.port_of_discharge
    fill_in "Port of loading", with: @offer.port_of_loading
    fill_in "Product", with: @offer.product_id
    fill_in "Risk sold amount", with: @offer.risk_sold_amount
    fill_in "Spread", with: @offer.spread
    fill_in "Tenor days", with: @offer.tenor_days
    fill_in "Transaction amount", with: @offer.transaction_amount
    fill_in "Valid until", with: @offer.valid_until
    click_on "Create Offer"

    assert_text "Offer was successfully created"
    assert_selector "h1", text: "Offers"
  end

  test "updating a Offer" do
    visit offer_url(@offer)
    click_on "Edit", match: :first

    fill_in "Account", with: @offer.account_id
    fill_in "Base rate", with: @offer.base_rate_id
    fill_in "Currency", with: @offer.currency_id
    check "Disclosed" if @offer.disclosed
    fill_in "Expiry date", with: @offer.expiry_date
    fill_in "Final destination", with: @offer.final_destination
    fill_in "Fixed rate", with: @offer.fixed_rate
    check "Open offer" if @offer.open_offer
    fill_in "Percentage sold", with: @offer.percentage_sold
    fill_in "Place of taking incharge", with: @offer.place_of_taking_incharge
    fill_in "Port of discharge", with: @offer.port_of_discharge
    fill_in "Port of loading", with: @offer.port_of_loading
    fill_in "Product", with: @offer.product_id
    fill_in "Risk sold amount", with: @offer.risk_sold_amount
    fill_in "Spread", with: @offer.spread
    fill_in "Tenor days", with: @offer.tenor_days
    fill_in "Transaction amount", with: @offer.transaction_amount
    fill_in "Valid until", with: @offer.valid_until
    click_on "Update Offer"

    assert_text "Offer was successfully updated"
    assert_selector "h1", text: "Offers"
  end

  test "destroying a Offer" do
    visit edit_offer_url(@offer)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Offer was successfully destroyed"
  end
end
