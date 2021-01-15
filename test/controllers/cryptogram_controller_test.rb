require 'test_helper'

class CryptogramControllerTest < ActionDispatch::IntegrationTest
  test "Get new Cryptogram" do
    get api_cryptograms_url
    
    assert_response :success
    assert_not_equal @response.body, ""
  end

  test "Get existing Cryptogram" do
    get api_cryptograms_url, params: { "identifier" => "si0W7J/mDN8PXimgtWggRQVJtC2IvdJk7fCoTMVPpXs=" }
    
    assert_response :success
    assert_not_equal @response.body, ""
  end

  test "Get existing Cryptogram identifier in url" do
    get api_cryptograms_url("si0W7J/mDN8PXimgtWggRQVJtC2IvdJk7fCoTMVPpXs=")
    
    assert_response :success
    assert_not_equal @response.body, ""
  end

  test "Check solution - success" do
    post api_cryptograms_check_url, params: {
      "identifier" => "si0W7J/mDN8PXimgtWggRQVJtC2IvdJk7fCoTMVPpXs=",
      "solution" => "PUT THE LIME IN THE COCONUT AND SHAKE IT ALL UP"
    }

    assert_not_equal @response.body, ""

    parsed_response = JSON.parse(@response.body)

    assert_response :success
    assert_equal(parsed_response["success"], true)
  end

  test "Check solution - fail" do
    post api_cryptograms_check_url, params: {
      "identifier" => "si0W7J/mDN8PXimgtWggRQVJtC2IvdJk7fCoTMVPpXs=",
      "solution" => "BLA HBL AHBL"
    }

    assert_not_equal @response.body, ""

    parsed_response = JSON.parse(@response.body)

    assert_response :success
    assert_equal(parsed_response["success"], false)
  end

end
