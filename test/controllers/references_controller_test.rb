require 'test_helper'

class ReferencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reference = references(:one)
  end

  test "should get index" do
    get references_url, as: :json
    assert_response :success
  end

  test "should create reference" do
    assert_difference('Reference.count') do
      post references_url, params: { reference: { author_id: @reference.author_id, holding_id: @reference.holding_id, publisher_id: @reference.publisher_id, subtitle: @reference.subtitle, title: @reference.title } }, as: :json
    end

    assert_response 201
  end

  test "should show reference" do
    get reference_url(@reference), as: :json
    assert_response :success
  end

  test "should update reference" do
    patch reference_url(@reference), params: { reference: { author_id: @reference.author_id, holding_id: @reference.holding_id, publisher_id: @reference.publisher_id, subtitle: @reference.subtitle, title: @reference.title } }, as: :json
    assert_response 200
  end

  test "should destroy reference" do
    assert_difference('Reference.count', -1) do
      delete reference_url(@reference), as: :json
    end

    assert_response 204
  end
end
