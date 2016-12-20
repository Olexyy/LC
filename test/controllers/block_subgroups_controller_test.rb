require 'test_helper'

class BlockSubgroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @block_subgroup = block_subgroups(:one)
  end

  test "should get index" do
    get block_subgroups_url
    assert_response :success
  end

  test "should get new" do
    get new_block_subgroup_url
    assert_response :success
  end

  test "should create block_subgroup" do
    assert_difference('BlockSubgroup.count') do
      post block_subgroups_url, params: { block_subgroup: { block_group_id: @block_subgroup.block_group_id, name: @block_subgroup.name, weight: @block_subgroup.weight } }
    end

    assert_redirected_to block_subgroup_url(BlockSubgroup.last)
  end

  test "should show block_subgroup" do
    get block_subgroup_url(@block_subgroup)
    assert_response :success
  end

  test "should get edit" do
    get edit_block_subgroup_url(@block_subgroup)
    assert_response :success
  end

  test "should update block_subgroup" do
    patch block_subgroup_url(@block_subgroup), params: { block_subgroup: { block_group_id: @block_subgroup.block_group_id, name: @block_subgroup.name, weight: @block_subgroup.weight } }
    assert_redirected_to block_subgroup_url(@block_subgroup)
  end

  test "should destroy block_subgroup" do
    assert_difference('BlockSubgroup.count', -1) do
      delete block_subgroup_url(@block_subgroup)
    end

    assert_redirected_to block_subgroups_url
  end
end
