require "test_helper"

class MatchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get matches_index_url
    assert_response :success
  end

  test "should get show" do
    get matches_show_url
    assert_response :success
  end

  test "should get create" do
    get matches_create_url
    assert_response :success
  end

  test "should get update" do
    get matches_update_url
    assert_response :success
  end

  test "should get delete" do
    get matches_delete_url
    assert_response :success
  end
end
