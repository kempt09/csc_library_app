require 'test_helper'

class HoldingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @holding = holdings(:one)
  end

  test "should get index" do
    get holdings_url, as: :json
    assert_response :success
  end

  test "should create holding" do
    assert_difference('Holding.count') do
      post holdings_url, params: { holding: { section: @holding.section, title: @holding.title } }, as: :json
    end

    assert_response 201
  end

  test "should show holding" do
    get holding_url(@holding), as: :json
    assert_response :success
  end

  test "should update holding" do
    patch holding_url(@holding), params: { holding: { section: @holding.section, title: @holding.title } }, as: :json
    assert_response 200
  end

  test "should destroy holding" do
    assert_difference('Holding.count', -1) do
      delete holding_url(@holding), as: :json
    end

    assert_response 204
  end
end
