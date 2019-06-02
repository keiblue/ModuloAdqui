require "application_system_test_case"

class AccountsTest < ApplicationSystemTestCase
  setup do
    @account = accounts(:one)
  end

  test "visiting the index" do
    visit accounts_url
    assert_selector "h1", text: "Accounts"
  end

  test "creating a Account" do
    visit accounts_url
    click_on "New Account"

    fill_in "1", with: @account.1
    fill_in "Email", with: @account.email
    fill_in "Last name", with: @account.last_name
    fill_in "Name", with: @account.name
    fill_in "Password", with: @account.password
    fill_in "Role", with: @account.role
    fill_in "Rut", with: @account.rut
    fill_in "Rut dv", with: @account.rut_dv
    click_on "Create Account"

    assert_text "Account was successfully created"
    click_on "Back"
  end

  test "updating a Account" do
    visit accounts_url
    click_on "Edit", match: :first

    fill_in "1", with: @account.1
    fill_in "Email", with: @account.email
    fill_in "Last name", with: @account.last_name
    fill_in "Name", with: @account.name
    fill_in "Password", with: @account.password
    fill_in "Role", with: @account.role
    fill_in "Rut", with: @account.rut
    fill_in "Rut dv", with: @account.rut_dv
    click_on "Update Account"

    assert_text "Account was successfully updated"
    click_on "Back"
  end

  test "destroying a Account" do
    visit accounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Account was successfully destroyed"
  end
end
