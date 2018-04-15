require 'test_helper'

class ApartmentBuildingsControllerTest < ActionController::TestCase
  setup do
    @apartment_building = apartment_buildings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apartment_buildings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apartment_building" do
    assert_difference('ApartmentBuilding.count') do
      post :create, apartment_building: { address: @apartment_building.address, name: @apartment_building.name }
    end

    assert_redirected_to apartment_building_path(assigns(:apartment_building))
  end

  test "should show apartment_building" do
    get :show, id: @apartment_building
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apartment_building
    assert_response :success
  end

  test "should update apartment_building" do
    patch :update, id: @apartment_building, apartment_building: { address: @apartment_building.address, name: @apartment_building.name }
    assert_redirected_to apartment_building_path(assigns(:apartment_building))
  end

  test "should destroy apartment_building" do
    assert_difference('ApartmentBuilding.count', -1) do
      delete :destroy, id: @apartment_building
    end

    assert_redirected_to apartment_buildings_path
  end
end
