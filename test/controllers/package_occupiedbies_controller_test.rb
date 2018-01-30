require 'test_helper'

class PackageOccupiedbiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @package_occupiedby = package_occupiedbies(:one)
  end

  test "should get index" do
    get package_occupiedbies_url
    assert_response :success
  end

  test "should get new" do
    get new_package_occupiedby_url
    assert_response :success
  end

  test "should create package_occupiedby" do
    assert_difference('PackageOccupiedby.count') do
      post package_occupiedbies_url, params: { package_occupiedby: { balance_session: @package_occupiedby.balance_session, end_date: @package_occupiedby.end_date, member_id: @package_occupiedby.member_id, start_date: @package_occupiedby.start_date, trainer_package: @package_occupiedby.trainer_package } }
    end

    assert_redirected_to package_occupiedby_url(PackageOccupiedby.last)
  end

  test "should show package_occupiedby" do
    get package_occupiedby_url(@package_occupiedby)
    assert_response :success
  end

  test "should get edit" do
    get edit_package_occupiedby_url(@package_occupiedby)
    assert_response :success
  end

  test "should update package_occupiedby" do
    patch package_occupiedby_url(@package_occupiedby), params: { package_occupiedby: { balance_session: @package_occupiedby.balance_session, end_date: @package_occupiedby.end_date, member_id: @package_occupiedby.member_id, start_date: @package_occupiedby.start_date, trainer_package: @package_occupiedby.trainer_package } }
    assert_redirected_to package_occupiedby_url(@package_occupiedby)
  end

  test "should destroy package_occupiedby" do
    assert_difference('PackageOccupiedby.count', -1) do
      delete package_occupiedby_url(@package_occupiedby)
    end

    assert_redirected_to package_occupiedbies_url
  end
end
