require "test_helper"

class BidStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bid_status = bid_statuses(:one)
  end

  test "should get index" do
    get bid_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_bid_status_url
    assert_response :success
  end

  test "should create bid_status" do
    assert_difference('BidStatus.count') do
      post bid_statuses_url, params: { bid_status: { name: @bid_status.name } }
    end

    assert_redirected_to bid_status_url(BidStatus.last)
  end

  test "should show bid_status" do
    get bid_status_url(@bid_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_bid_status_url(@bid_status)
    assert_response :success
  end

  test "should update bid_status" do
    patch bid_status_url(@bid_status), params: { bid_status: { name: @bid_status.name } }
    assert_redirected_to bid_status_url(@bid_status)
  end

  test "should destroy bid_status" do
    assert_difference('BidStatus.count', -1) do
      delete bid_status_url(@bid_status)
    end

    assert_redirected_to bid_statuses_url
  end
end
