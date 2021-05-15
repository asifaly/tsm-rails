require "application_system_test_case"

class BaseRatesTest < ApplicationSystemTestCase
  setup do
    @base_rate = base_rates(:one)
  end

  test "visiting the index" do
    visit base_rates_url
    assert_selector "h1", text: "Base Rates"
  end

  test "creating a Base rate" do
    visit base_rates_url
    click_on "New Base Rate"

    fill_in "Description", with: @base_rate.description
    click_on "Create Base rate"

    assert_text "Base rate was successfully created"
    assert_selector "h1", text: "Base Rates"
  end

  test "updating a Base rate" do
    visit base_rate_url(@base_rate)
    click_on "Edit", match: :first

    fill_in "Description", with: @base_rate.description
    click_on "Update Base rate"

    assert_text "Base rate was successfully updated"
    assert_selector "h1", text: "Base Rates"
  end

  test "destroying a Base rate" do
    visit edit_base_rate_url(@base_rate)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Base rate was successfully destroyed"
  end
end
