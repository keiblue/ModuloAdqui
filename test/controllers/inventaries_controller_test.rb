require 'test_helper'

class InventariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inventary = inventaries(:one)
  end

  test "should get index" do
    get inventaries_url
    assert_response :success
  end

  test "should get new" do
    get new_inventary_url
    assert_response :success
  end

  test "should create inventary" do
    assert_difference('Inventary.count') do
      post inventaries_url, params: { inventary: { count: @inventary.count, name: @inventary.name } }
    end

    assert_redirected_to inventary_url(Inventary.last)
  end

  test "should show inventary" do
    get inventary_url(@inventary)
    assert_response :success
  end

  test "should get edit" do
    get edit_inventary_url(@inventary)
    assert_response :success
  end

  test "should update inventary" do
    patch inventary_url(@inventary), params: { inventary: { count: @inventary.count, name: @inventary.name } }
    assert_redirected_to inventary_url(@inventary)
  end

  test "should destroy inventary" do
    assert_difference('Inventary.count', -1) do
      delete inventary_url(@inventary)
    end

    assert_redirected_to inventaries_url
  end
end
