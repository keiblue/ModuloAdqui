require "application_system_test_case"

class InventariesTest < ApplicationSystemTestCase
  setup do
    @inventary = inventaries(:one)
  end

  test "visiting the index" do
    visit inventaries_url
    assert_selector "h1", text: "Inventaries"
  end

  test "creating a Inventary" do
    visit inventaries_url
    click_on "New Inventary"

    fill_in "Count", with: @inventary.count
    fill_in "Name", with: @inventary.name
    click_on "Create Inventary"

    assert_text "Inventary was successfully created"
    click_on "Back"
  end

  test "updating a Inventary" do
    visit inventaries_url
    click_on "Edit", match: :first

    fill_in "Count", with: @inventary.count
    fill_in "Name", with: @inventary.name
    click_on "Update Inventary"

    assert_text "Inventary was successfully updated"
    click_on "Back"
  end

  test "destroying a Inventary" do
    visit inventaries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Inventary was successfully destroyed"
  end
end
