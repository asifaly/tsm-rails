require "application_system_test_case"

class PartiesTest < ApplicationSystemTestCase
  setup do
    @party = parties(:one)
  end

  test "visiting the index" do
    visit parties_url
    assert_selector "h1", text: "Parties"
  end

  test "creating a Party" do
    visit parties_url
    click_on "New Party"

    fill_in "Account", with: @party.account_id
    fill_in "Bic", with: @party.bic
    fill_in "City", with: @party.city
    fill_in "Country", with: @party.country_id
    fill_in "Name", with: @party.name
    click_on "Create Party"

    assert_text "Party was successfully created"
    assert_selector "h1", text: "Parties"
  end

  test "updating a Party" do
    visit party_url(@party)
    click_on "Edit", match: :first

    fill_in "Account", with: @party.account_id
    fill_in "Bic", with: @party.bic
    fill_in "City", with: @party.city
    fill_in "Country", with: @party.country_id
    fill_in "Name", with: @party.name
    click_on "Update Party"

    assert_text "Party was successfully updated"
    assert_selector "h1", text: "Parties"
  end

  test "destroying a Party" do
    visit edit_party_url(@party)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Party was successfully destroyed"
  end
end
