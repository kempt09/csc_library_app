require 'test_helper'

class PeriodicalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @periodical = periodicals(:one)
  end

  test "should get index" do
    get periodicals_url, as: :json
    assert_response :success
  end

  test "should create periodical" do
    assert_difference('Periodical.count') do
      post periodicals_url, params: { periodical: { author_id: @periodical.author_id, holding_id: @periodical.holding_id, publisher_id: @periodical.publisher_id, title: @periodical.title, volume: @periodical.volume, volume_no: @periodical.volume_no } }, as: :json
    end

    assert_response 201
  end

  test "should show periodical" do
    get periodical_url(@periodical), as: :json
    assert_response :success
  end

  test "should update periodical" do
    patch periodical_url(@periodical), params: { periodical: { author_id: @periodical.author_id, holding_id: @periodical.holding_id, publisher_id: @periodical.publisher_id, title: @periodical.title, volume: @periodical.volume, volume_no: @periodical.volume_no } }, as: :json
    assert_response 200
  end

  test "should destroy periodical" do
    assert_difference('Periodical.count', -1) do
      delete periodical_url(@periodical), as: :json
    end

    assert_response 204
  end
end
