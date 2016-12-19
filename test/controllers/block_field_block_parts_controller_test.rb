require 'test_helper'

class BlockFieldBlockPartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @block_field_block_part = block_field_block_parts(:one)
  end

  test "should get index" do
    get block_field_block_parts_url
    assert_response :success
  end

  test "should get new" do
    get new_block_field_block_part_url
    assert_response :success
  end

  test "should create block_field_block_part" do
    assert_difference('BlockFieldBlockPart.count') do
      post block_field_block_parts_url, params: { block_field_block_part: { block_field_id: @block_field_block_part.block_field_id, block_part_id: @block_field_block_part.block_part_id } }
    end

    assert_redirected_to block_field_block_part_url(BlockFieldBlockPart.last)
  end

  test "should show block_field_block_part" do
    get block_field_block_part_url(@block_field_block_part)
    assert_response :success
  end

  test "should get edit" do
    get edit_block_field_block_part_url(@block_field_block_part)
    assert_response :success
  end

  test "should update block_field_block_part" do
    patch block_field_block_part_url(@block_field_block_part), params: { block_field_block_part: { block_field_id: @block_field_block_part.block_field_id, block_part_id: @block_field_block_part.block_part_id } }
    assert_redirected_to block_field_block_part_url(@block_field_block_part)
  end

  test "should destroy block_field_block_part" do
    assert_difference('BlockFieldBlockPart.count', -1) do
      delete block_field_block_part_url(@block_field_block_part)
    end

    assert_redirected_to block_field_block_parts_url
  end
end
