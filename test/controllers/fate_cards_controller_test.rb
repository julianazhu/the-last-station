require 'test_helper'

class FateCardsControllerTest < ActionController::TestCase
  setup do
    @fate_card = fate_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fate_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fate_card" do
    assert_difference('FateCard.count') do
      post :create, fate_card: {  }
    end

    assert_redirected_to fate_card_path(assigns(:fate_card))
  end

  test "should show fate_card" do
    get :show, id: @fate_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fate_card
    assert_response :success
  end

  test "should update fate_card" do
    patch :update, id: @fate_card, fate_card: {  }
    assert_redirected_to fate_card_path(assigns(:fate_card))
  end

  test "should destroy fate_card" do
    assert_difference('FateCard.count', -1) do
      delete :destroy, id: @fate_card
    end

    assert_redirected_to fate_cards_path
  end
end
