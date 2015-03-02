require 'test_helper'

class OasisPagesControllerTest < ActionController::TestCase
  setup do
    @oasis_page = oasis_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:oasis_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create oasis_page" do
    assert_difference('OasisPage.count') do
      post :create, oasis_page: { description: @oasis_page.description, name: @oasis_page.name }
    end

    assert_redirected_to oasis_page_path(assigns(:oasis_page))
  end

  test "should show oasis_page" do
    get :show, id: @oasis_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @oasis_page
    assert_response :success
  end

  test "should update oasis_page" do
    put :update, id: @oasis_page, oasis_page: { description: @oasis_page.description, name: @oasis_page.name }
    assert_redirected_to oasis_page_path(assigns(:oasis_page))
  end

  test "should destroy oasis_page" do
    assert_difference('OasisPage.count', -1) do
      delete :destroy, id: @oasis_page
    end

    assert_redirected_to oasis_pages_path
  end
end
