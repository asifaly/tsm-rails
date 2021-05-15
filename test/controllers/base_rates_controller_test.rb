require "test_helper"

class BaseRatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @base_rate = base_rates(:one)
  end

  test "should get index" do
    get base_rates_url
    assert_response :success
  end

  test "should get new" do
    get new_base_rate_url
    assert_response :success
  end

  test "should create base_rate" do
    assert_difference('BaseRate.count') do
      post base_rates_url, params: { base_rate: { description: @base_rate.description } }
    end

    assert_redirected_to base_rate_url(BaseRate.last)
  end

  test "should show base_rate" do
    get base_rate_url(@base_rate)
    assert_response :success
  end

  test "should get edit" do
    get edit_base_rate_url(@base_rate)
    assert_response :success
  end

  test "should update base_rate" do
    patch base_rate_url(@base_rate), params: { base_rate: { description: @base_rate.description } }
    assert_redirected_to base_rate_url(@base_rate)
  end

  test "should destroy base_rate" do
    assert_difference('BaseRate.count', -1) do
      delete base_rate_url(@base_rate)
    end

    assert_redirected_to base_rates_url
  end
end
