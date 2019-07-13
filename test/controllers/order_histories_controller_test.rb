require 'test_helper'

class OrderHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_history = order_histories(:one)
  end

  test "should get index" do
    get order_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_order_history_url
    assert_response :success
  end

  test "should create order_history" do
    assert_difference('OrderHistory.count') do
      post order_histories_url, params: { order_history: {  } }
    end

    assert_redirected_to order_history_url(OrderHistory.last)
  end

  test "should show order_history" do
    get order_history_url(@order_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_history_url(@order_history)
    assert_response :success
  end

  test "should update order_history" do
    patch order_history_url(@order_history), params: { order_history: {  } }
    assert_redirected_to order_history_url(@order_history)
  end

  test "should destroy order_history" do
    assert_difference('OrderHistory.count', -1) do
      delete order_history_url(@order_history)
    end

    assert_redirected_to order_histories_url
  end
end
