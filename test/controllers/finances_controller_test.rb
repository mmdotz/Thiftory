require 'test_helper'

class FinancesControllerTest < ActionController::TestCase
  setup do
    @finance = finances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finance" do
    assert_difference('Finance.count') do
      post :create, finance: { buyer_pmt: @finance.buyer_pmt, item_id: @finance.item_id,
         'pre_sale_cost': @finance.pre_sale_cost, 'pre_sale_notes': @finance.pre_sale_notes,
         procure_cost: @finance.procure_cost, shipping_cost: @finance.shipping_cost }
    end

    assert_redirected_to finance_path(assigns(:finance))
  end

  test "should show finance" do
    get :show, id: @finance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @finance
    assert_response :success
  end

  test "should update finance" do
    patch :update, id: @finance, finance: { buyer_pmt: @finance.buyer_pmt, item_id: @finance.item_id, 'pre_sale_cost': @finance.pre_sale_cost, 'pre_sale_notes': @finance.pre_sale_notes, procure_cost: @finance.procure_cost, shipping_cost: @finance.shipping_cost }
    assert_redirected_to finance_path(assigns(:finance))
  end

  test "should destroy finance" do
    assert_difference('Finance.count', -1) do
      delete :destroy, id: @finance
    end

    assert_redirected_to finances_path
  end
end
