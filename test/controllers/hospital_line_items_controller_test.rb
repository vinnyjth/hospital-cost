require 'test_helper'

class HospitalLineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hospital_line_item = hospital_line_items(:one)
  end

  test "should get index" do
    get hospital_line_items_url, as: :json
    assert_response :success
  end

  test "should create hospital_line_item" do
    assert_difference('HospitalLineItem.count') do
      post hospital_line_items_url, params: { hospital_line_item: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show hospital_line_item" do
    get hospital_line_item_url(@hospital_line_item), as: :json
    assert_response :success
  end

  test "should update hospital_line_item" do
    patch hospital_line_item_url(@hospital_line_item), params: { hospital_line_item: {  } }, as: :json
    assert_response 200
  end

  test "should destroy hospital_line_item" do
    assert_difference('HospitalLineItem.count', -1) do
      delete hospital_line_item_url(@hospital_line_item), as: :json
    end

    assert_response 204
  end
end
