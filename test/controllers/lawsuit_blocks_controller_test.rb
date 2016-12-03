require 'test_helper'

class LawsuitBlocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lawsuit_block = lawsuit_blocks(:one)
  end

  test "should get index" do
    get lawsuit_blocks_url
    assert_response :success
  end

  test "should get new" do
    get new_lawsuit_block_url
    assert_response :success
  end

  test "should create lawsuit_block" do
    assert_difference('LawsuitBlock.count') do
      post lawsuit_blocks_url, params: { lawsuit_block: { block_id: @lawsuit_block.block_id, lawsuit_id: @lawsuit_block.lawsuit_id, weight: @lawsuit_block.weight } }
    end

    assert_redirected_to lawsuit_block_url(LawsuitBlock.last)
  end

  test "should show lawsuit_block" do
    get lawsuit_block_url(@lawsuit_block)
    assert_response :success
  end

  test "should get edit" do
    get edit_lawsuit_block_url(@lawsuit_block)
    assert_response :success
  end

  test "should update lawsuit_block" do
    patch lawsuit_block_url(@lawsuit_block), params: { lawsuit_block: { block_id: @lawsuit_block.block_id, lawsuit_id: @lawsuit_block.lawsuit_id, weight: @lawsuit_block.weight } }
    assert_redirected_to lawsuit_block_url(@lawsuit_block)
  end

  test "should destroy lawsuit_block" do
    assert_difference('LawsuitBlock.count', -1) do
      delete lawsuit_block_url(@lawsuit_block)
    end

    assert_redirected_to lawsuit_blocks_url
  end
end
