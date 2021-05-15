require "application_system_test_case"

class BaseProductsTest < ApplicationSystemTestCase
  setup do
    @base_product = base_products(:one)
  end

  test "visiting the index" do
    visit base_products_url
    assert_selector "h1", text: "Base Products"
  end

  test "creating a Base product" do
    visit base_products_url
    click_on "New Base Product"

    fill_in "Description", with: @base_product.description
    click_on "Create Base product"

    assert_text "Base product was successfully created"
    assert_selector "h1", text: "Base Products"
  end

  test "updating a Base product" do
    visit base_product_url(@base_product)
    click_on "Edit", match: :first

    fill_in "Description", with: @base_product.description
    click_on "Update Base product"

    assert_text "Base product was successfully updated"
    assert_selector "h1", text: "Base Products"
  end

  test "destroying a Base product" do
    visit edit_base_product_url(@base_product)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Base product was successfully destroyed"
  end
end
