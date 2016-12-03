require 'test_helper'

class BlockFieldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @block_field = block_fields(:one)
  end

  test "should get index" do
    get block_fields_url
    assert_response :success
  end

  test "should get new" do
    get new_block_field_url
    assert_response :success
  end

  test "should create block_field" do
    assert_difference('BlockField.count') do
      post block_fields_url, params: { block_field: { data_type: @block_field.data_type, marker: @block_field.marker, name: @block_field.name, text: @block_field.text, weight: @block_field.weight } }
    end

    assert_redirected_to block_field_url(BlockField.last)
  end

  test "should show block_field" do
    get block_field_url(@block_field)
    assert_response :success
  end

  test "should get edit" do
    get edit_block_field_url(@block_field)
    assert_response :success
  end

  test "should update block_field" do
    patch block_field_url(@block_field), params: { block_field: { data_type: @block_field.data_type, marker: @block_field.marker, name: @block_field.name, text: @block_field.text, weight: @block_field.weight } }
    assert_redirected_to block_field_url(@block_field)
  end

  test "should destroy block_field" do
    assert_difference('BlockField.count', -1) do
      delete block_field_url(@block_field)
    end

    assert_redirected_to block_fields_url
  end
end
