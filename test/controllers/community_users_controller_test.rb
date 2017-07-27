require 'test_helper'

class CommunityUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @community_user = community_users(:one)
  end

  test "should get index" do
    get community_users_url, as: :json
    assert_response :success
  end

  test "should create community_user" do
    assert_difference('CommunityUser.count') do
      post community_users_url, params: { community_user: { expiration_dt: @community_user.expiration_dt, user_id: @community_user.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show community_user" do
    get community_user_url(@community_user), as: :json
    assert_response :success
  end

  test "should update community_user" do
    patch community_user_url(@community_user), params: { community_user: { expiration_dt: @community_user.expiration_dt, user_id: @community_user.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy community_user" do
    assert_difference('CommunityUser.count', -1) do
      delete community_user_url(@community_user), as: :json
    end

    assert_response 204
  end
end
