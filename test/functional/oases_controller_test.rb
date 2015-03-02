require 'test_helper'

class OasesControllerTest < ActionController::TestCase
  setup do
    @oase = oases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:oases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create oase" do
    assert_difference('Oasis.count') do
      post :create, oase: { description: @oase.description, page_id: @oase.page_id }
    end

    assert_redirected_to oase_path(assigns(:oase))
  end

  test "should show oase" do
    get :show, id: @oase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @oase
    assert_response :success
  end

  test "should update oase" do
    put :update, id: @oase, oase: { description: @oase.description, page_id: @oase.page_id }
    assert_redirected_to oase_path(assigns(:oase))
  end

  test "should destroy oase" do
    assert_difference('Oasis.count', -1) do
      delete :destroy, id: @oase
    end

    assert_redirected_to oases_path
  end
end
