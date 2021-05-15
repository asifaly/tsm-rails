require "test_helper"

class OfferStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offer_status = offer_statuses(:one)
  end

  test "should get index" do
    get offer_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_offer_status_url
    assert_response :success
  end

  test "should create offer_status" do
    assert_difference('OfferStatus.count') do
      post offer_statuses_url, params: { offer_status: { name: @offer_status.name } }
    end

    assert_redirected_to offer_status_url(OfferStatus.last)
  end

  test "should show offer_status" do
    get offer_status_url(@offer_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_offer_status_url(@offer_status)
    assert_response :success
  end

  test "should update offer_status" do
    patch offer_status_url(@offer_status), params: { offer_status: { name: @offer_status.name } }
    assert_redirected_to offer_status_url(@offer_status)
  end

  test "should destroy offer_status" do
    assert_difference('OfferStatus.count', -1) do
      delete offer_status_url(@offer_status)
    end

    assert_redirected_to offer_statuses_url
  end
end
