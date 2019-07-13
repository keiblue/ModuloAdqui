require "application_system_test_case"

class OrderHistoriesTest < ApplicationSystemTestCase
  setup do
    @order_history = order_histories(:one)
  end

  test "visiting the index" do
    visit order_histories_url
    assert_selector "h1", text: "Order Histories"
  end

  test "creating a Order history" do
    visit order_histories_url
    click_on "New Order History"

    click_on "Create Order history"

    assert_text "Order history was successfully created"
    click_on "Back"
  end

  test "updating a Order history" do
    visit order_histories_url
    click_on "Edit", match: :first

    click_on "Update Order history"

    assert_text "Order history was successfully updated"
    click_on "Back"
  end

  test "destroying a Order history" do
    visit order_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order history was successfully destroyed"
  end
end
