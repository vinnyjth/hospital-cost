require 'test_helper'

class ScrapersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scraper = scrapers(:one)
  end

  test "should get index" do
    get scrapers_url, as: :json
    assert_response :success
  end

  test "should create scraper" do
    assert_difference('Scraper.count') do
      post scrapers_url, params: { scraper: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show scraper" do
    get scraper_url(@scraper), as: :json
    assert_response :success
  end

  test "should update scraper" do
    patch scraper_url(@scraper), params: { scraper: {  } }, as: :json
    assert_response 200
  end

  test "should destroy scraper" do
    assert_difference('Scraper.count', -1) do
      delete scraper_url(@scraper), as: :json
    end

    assert_response 204
  end
end
