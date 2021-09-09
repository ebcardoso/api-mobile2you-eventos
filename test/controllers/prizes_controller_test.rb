require "test_helper"

class PrizesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prize = prizes(:one)
  end

  test "should get index" do
    get prizes_url, as: :json
    assert_response :success
  end

  test "should create prize" do
    assert_difference('Prize.count') do
      post prizes_url, params: { prize: { name: @prize.name, participation_id: @prize.participation_id } }, as: :json
    end

    assert_response 201
  end

  test "should show prize" do
    get prize_url(@prize), as: :json
    assert_response :success
  end

  test "should update prize" do
    patch prize_url(@prize), params: { prize: { name: @prize.name, participation_id: @prize.participation_id } }, as: :json
    assert_response 200
  end

  test "should destroy prize" do
    assert_difference('Prize.count', -1) do
      delete prize_url(@prize), as: :json
    end

    assert_response 204
  end
end
