require 'test_helper'

class ChangesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get changes_index_url
    assert_response :success
  end

  test "should get edit" do
    get changes_edit_url
    assert_response :success
  end

end
