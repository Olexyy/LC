require 'test_helper'

class WebResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @web_resource = web_resources(:one)
  end

  test "should get index" do
    get web_resources_url
    assert_response :success
  end

  test "should get new" do
    get new_web_resource_url
    assert_response :success
  end

  test "should create web_resource" do
    assert_difference('WebResource.count') do
      post web_resources_url, params: { web_resource: { body: @web_resource.body, key: @web_resource.key, name: @web_resource.name, title: @web_resource.title, weight: @web_resource.weight } }
    end

    assert_redirected_to web_resource_url(WebResource.last)
  end

  test "should show web_resource" do
    get web_resource_url(@web_resource)
    assert_response :success
  end

  test "should get edit" do
    get edit_web_resource_url(@web_resource)
    assert_response :success
  end

  test "should update web_resource" do
    patch web_resource_url(@web_resource), params: { web_resource: { body: @web_resource.body, key: @web_resource.key, name: @web_resource.name, title: @web_resource.title, weight: @web_resource.weight } }
    assert_redirected_to web_resource_url(@web_resource)
  end

  test "should destroy web_resource" do
    assert_difference('WebResource.count', -1) do
      delete web_resource_url(@web_resource)
    end

    assert_redirected_to web_resources_url
  end
end
