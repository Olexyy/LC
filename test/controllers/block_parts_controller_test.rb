require 'test_helper'

class BlockPartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @block_part = block_parts(:one)
  end

  test "should get index" do
    get block_parts_url
    assert_response :success
  end

  test "should get new" do
    get new_block_part_url
    assert_response :success
  end

  test "should create block_part" do
    assert_difference('BlockPart.count') do
      post block_parts_url, params: { block_part: { block_id: @block_part.block_id, name: @block_part.name, text: @block_part.text, text_style_id: @block_part.text_style_id, weight: @block_part.weight } }
    end

    assert_redirected_to block_part_url(BlockPart.last)
  end

  test "should show block_part" do
    get block_part_url(@block_part)
    assert_response :success
  end

  test "should get edit" do
    get edit_block_part_url(@block_part)
    assert_response :success
  end

  test "should update block_part" do
    patch block_part_url(@block_part), params: { block_part: { block_id: @block_part.block_id, name: @block_part.name, text: @block_part.text, text_style_id: @block_part.text_style_id, weight: @block_part.weight } }
    assert_redirected_to block_part_url(@block_part)
  end

  test "should destroy block_part" do
    assert_difference('BlockPart.count', -1) do
      delete block_part_url(@block_part)
    end

    assert_redirected_to block_parts_url
  end
end
