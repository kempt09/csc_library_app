require 'test_helper'

class CirculationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @circulation = circulations(:one)
  end

  test "should get index" do
    get circulations_url, as: :json
    assert_response :success
  end

  test "should create circulation" do
    assert_difference('Circulation.count') do
      post circulations_url, params: { circulation: { author_id: @circulation.author_id, cost: @circulation.cost, holding_id: @circulation.holding_id, subtitle: @circulation.subtitle, title: @circulation.title } }, as: :json
    end

    assert_response 201
  end

  test "should show circulation" do
    get circulation_url(@circulation), as: :json
    assert_response :success
  end

  test "should update circulation" do
    patch circulation_url(@circulation), params: { circulation: { author_id: @circulation.author_id, cost: @circulation.cost, holding_id: @circulation.holding_id, subtitle: @circulation.subtitle, title: @circulation.title } }, as: :json
    assert_response 200
  end

  test "should destroy circulation" do
    assert_difference('Circulation.count', -1) do
      delete circulation_url(@circulation), as: :json
    end

    assert_response 204
  end
end
