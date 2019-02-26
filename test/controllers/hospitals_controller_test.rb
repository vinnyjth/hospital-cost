require 'test_helper'

class HospitalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hospital = hospitals(:one)
  end

  test "should get index" do
    get hospitals_url, as: :json
    assert_response :success
  end

  test "should create hospital" do
    assert_difference('Hospital.count') do
      post hospitals_url, params: { hospital: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show hospital" do
    get hospital_url(@hospital), as: :json
    assert_response :success
  end

  test "should update hospital" do
    patch hospital_url(@hospital), params: { hospital: {  } }, as: :json
    assert_response 200
  end

  test "should destroy hospital" do
    assert_difference('Hospital.count', -1) do
      delete hospital_url(@hospital), as: :json
    end

    assert_response 204
  end
end
