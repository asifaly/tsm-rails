require "test_helper"

class OffersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offer = offers(:one)
  end

  test "should get index" do
    get offers_url
    assert_response :success
  end

  test "should get new" do
    get new_offer_url
    assert_response :success
  end

  test "should create offer" do
    assert_difference('Offer.count') do
      post offers_url, params: { offer: { account_id: @offer.account_id, base_rate_id: @offer.base_rate_id, currency_id: @offer.currency_id, disclosed: @offer.disclosed, expiry_date: @offer.expiry_date, final_destination: @offer.final_destination, fixed_rate: @offer.fixed_rate, open_offer: @offer.open_offer, percentage_sold: @offer.percentage_sold, place_of_taking_incharge: @offer.place_of_taking_incharge, port_of_discharge: @offer.port_of_discharge, port_of_loading: @offer.port_of_loading, product_id: @offer.product_id, risk_sold_amount: @offer.risk_sold_amount, spread: @offer.spread, tenor_days: @offer.tenor_days, transaction_amount: @offer.transaction_amount, valid_until: @offer.valid_until } }
    end

    assert_redirected_to offer_url(Offer.last)
  end

  test "should show offer" do
    get offer_url(@offer)
    assert_response :success
  end

  test "should get edit" do
    get edit_offer_url(@offer)
    assert_response :success
  end

  test "should update offer" do
    patch offer_url(@offer), params: { offer: { account_id: @offer.account_id, base_rate_id: @offer.base_rate_id, currency_id: @offer.currency_id, disclosed: @offer.disclosed, expiry_date: @offer.expiry_date, final_destination: @offer.final_destination, fixed_rate: @offer.fixed_rate, open_offer: @offer.open_offer, percentage_sold: @offer.percentage_sold, place_of_taking_incharge: @offer.place_of_taking_incharge, port_of_discharge: @offer.port_of_discharge, port_of_loading: @offer.port_of_loading, product_id: @offer.product_id, risk_sold_amount: @offer.risk_sold_amount, spread: @offer.spread, tenor_days: @offer.tenor_days, transaction_amount: @offer.transaction_amount, valid_until: @offer.valid_until } }
    assert_redirected_to offer_url(@offer)
  end

  test "should destroy offer" do
    assert_difference('Offer.count', -1) do
      delete offer_url(@offer)
    end

    assert_redirected_to offers_url
  end
end
