require 'test_helper'

class TripControllerTest < ActionController::TestCase
  test "get info" do
    get :info, format: "json", start: "Chapel Hill NC", stop: "Portland OR"
    assert_response :success
    assert response.body =~ /1 day 18 hours/
    assert response.body =~ /distance/
  end
end
