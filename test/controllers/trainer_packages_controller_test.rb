require 'test_helper'

class TrainerPackagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trainer_package = trainer_packages(:one)
  end

  test "should get index" do
    get trainer_packages_url
    assert_response :success
  end

  test "should get new" do
    get new_trainer_package_url
    assert_response :success
  end

  test "should create trainer_package" do
    assert_difference('TrainerPackage.count') do
      post trainer_packages_url, params: { trainer_package: {  } }
    end

    assert_redirected_to trainer_package_url(TrainerPackage.last)
  end

  test "should show trainer_package" do
    get trainer_package_url(@trainer_package)
    assert_response :success
  end

  test "should get edit" do
    get edit_trainer_package_url(@trainer_package)
    assert_response :success
  end

  test "should update trainer_package" do
    patch trainer_package_url(@trainer_package), params: { trainer_package: {  } }
    assert_redirected_to trainer_package_url(@trainer_package)
  end

  test "should destroy trainer_package" do
    assert_difference('TrainerPackage.count', -1) do
      delete trainer_package_url(@trainer_package)
    end

    assert_redirected_to trainer_packages_url
  end
end
