require 'test_helper'

class BlockGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @block_group = block_groups(:one)
  end

  test "should get index" do
    get block_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_block_group_url
    assert_response :success
  end

  test "should create block_group" do
    assert_difference('BlockGroup.count') do
      post block_groups_url, params: { block_group: { name: @block_group.name, weight: @block_group.weight } }
    end

    assert_redirected_to block_group_url(BlockGroup.last)
  end

  test "should show block_group" do
    get block_group_url(@block_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_block_group_url(@block_group)
    assert_response :success
  end

  test "should update block_group" do
    patch block_group_url(@block_group), params: { block_group: { name: @block_group.name, weight: @block_group.weight } }
    assert_redirected_to block_group_url(@block_group)
  end

  test "should destroy block_group" do
    assert_difference('BlockGroup.count', -1) do
      delete block_group_url(@block_group)
    end

    assert_redirected_to block_groups_url
  end
end
