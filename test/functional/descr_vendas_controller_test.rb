require 'test_helper'

class DescrVendasControllerTest < ActionController::TestCase
  setup do
    @descr_venda = descr_vendas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:descr_vendas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create descr_venda" do
    assert_difference('DescrVenda.count') do
      post :create, descr_venda: @descr_venda.attributes
    end

    assert_redirected_to descr_venda_path(assigns(:descr_venda))
  end

  test "should show descr_venda" do
    get :show, id: @descr_venda
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @descr_venda
    assert_response :success
  end

  test "should update descr_venda" do
    put :update, id: @descr_venda, descr_venda: @descr_venda.attributes
    assert_redirected_to descr_venda_path(assigns(:descr_venda))
  end

  test "should destroy descr_venda" do
    assert_difference('DescrVenda.count', -1) do
      delete :destroy, id: @descr_venda
    end

    assert_redirected_to descr_vendas_path
  end
end
