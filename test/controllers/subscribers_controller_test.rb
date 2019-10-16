require 'test_helper'

class SubscribersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscriber = subscribers(:one)
  end

  test "should get new" do
    get new_subscriber_url
    assert_response :success
  end

  test "should create subscriber" do
    assert_difference('Subscriber.count') do
      post subscribers_url, params: { subscriber: { sub_email: "newasdd@sadads.com"} }
    end
  end

  test "should destroy subscriber" do
    assert_difference('Subscriber.count', -1) do
      delete subscriber_url(@subscriber)
    end

    assert_redirected_to subscribers_url
  end
end
