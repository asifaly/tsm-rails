require "test_helper"

class BidsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bid = bids(:one)
  end

  test "should get index" do
    get bids_url
    assert_response :success
  end

  test "should get new" do
    get new_bid_url
    assert_response :success
  end

  test "should create bid" do
    assert_difference('Bid.count') do
      post bids_url, params: { bid: { account_id: @bid.account_id, base_rate_id: @bid.base_rate_id, bid_amount: @bid.bid_amount, bid_status_id: @bid.bid_status_id, bid_validity: @bid.bid_validity, offer_id: @bid.offer_id, rate: @bid.rate, spread: @bid.spread } }
    end

    assert_redirected_to bid_url(Bid.last)
  end

  test "should show bid" do
    get bid_url(@bid)
    assert_response :success
  end

  test "should get edit" do
    get edit_bid_url(@bid)
    assert_response :success
  end

  test "should update bid" do
    patch bid_url(@bid), params: { bid: { account_id: @bid.account_id, base_rate_id: @bid.base_rate_id, bid_amount: @bid.bid_amount, bid_status_id: @bid.bid_status_id, bid_validity: @bid.bid_validity, offer_id: @bid.offer_id, rate: @bid.rate, spread: @bid.spread } }
    assert_redirected_to bid_url(@bid)
  end

  test "should destroy bid" do
    assert_difference('Bid.count', -1) do
      delete bid_url(@bid)
    end

    assert_redirected_to bids_url
  end
end
