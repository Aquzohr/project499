require 'test_helper'

class NontrainerPackagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nontrainer_package = nontrainer_packages(:one)
  end

  test "should get index" do
    get nontrainer_packages_url
    assert_response :success
  end

  test "should get new" do
    get new_nontrainer_package_url
    assert_response :success
  end

  test "should create nontrainer_package" do
    assert_difference('NontrainerPackage.count') do
      post nontrainer_packages_url, params: { nontrainer_package: {  } }
    end

    assert_redirected_to nontrainer_package_url(NontrainerPackage.last)
  end

  test "should show nontrainer_package" do
    get nontrainer_package_url(@nontrainer_package)
    assert_response :success
  end

  test "should get edit" do
    get edit_nontrainer_package_url(@nontrainer_package)
    assert_response :success
  end

  test "should update nontrainer_package" do
    patch nontrainer_package_url(@nontrainer_package), params: { nontrainer_package: {  } }
    assert_redirected_to nontrainer_package_url(@nontrainer_package)
  end

  test "should destroy nontrainer_package" do
    assert_difference('NontrainerPackage.count', -1) do
      delete nontrainer_package_url(@nontrainer_package)
    end

    assert_redirected_to nontrainer_packages_url
  end
end
