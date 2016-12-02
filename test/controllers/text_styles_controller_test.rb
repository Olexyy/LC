require 'test_helper'

class TextStylesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @text_style = text_styles(:one)
  end

  test "should get index" do
    get text_styles_url
    assert_response :success
  end

  test "should get new" do
    get new_text_style_url
    assert_response :success
  end

  test "should create text_style" do
    assert_difference('TextStyle.count') do
      post text_styles_url, params: { text_style: { italic: @text_style.italic, margin_left: @text_style.margin_left, name: @text_style.name, strong: @text_style.strong, tag: @text_style.tag, text_align: @text_style.text_align, underline: @text_style.underline, weight: @text_style.weight } }
    end

    assert_redirected_to text_style_url(TextStyle.last)
  end

  test "should show text_style" do
    get text_style_url(@text_style)
    assert_response :success
  end

  test "should get edit" do
    get edit_text_style_url(@text_style)
    assert_response :success
  end

  test "should update text_style" do
    patch text_style_url(@text_style), params: { text_style: { italic: @text_style.italic, margin_left: @text_style.margin_left, name: @text_style.name, strong: @text_style.strong, tag: @text_style.tag, text_align: @text_style.text_align, underline: @text_style.underline, weight: @text_style.weight } }
    assert_redirected_to text_style_url(@text_style)
  end

  test "should destroy text_style" do
    assert_difference('TextStyle.count', -1) do
      delete text_style_url(@text_style)
    end

    assert_redirected_to text_styles_url
  end
end
