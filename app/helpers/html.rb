module Html
  #paths for partials
  PATH_MESSAGE = '/layouts/message'
  PATH_VALIDATION_NOTICE = '/layouts/validation_notice'
  #css classes
  CSS_LEAD = 'lead'
  CSS_LOWER_MENU = 'lower-menu'
  CSS_PAGE_HEADER = 'page-header'
  CSS_TEASER_TEXT = 'teaser-text'
  CSS_LIST_ITEM = 'list-item'
  CSS_LIST_CONTAINER = 'list-container'
  CSS_FIELD = 'field'
  CSS_ACTIONS = 'actions'
  CSS_SHOW = 'show'

  def bootstrap_col (num = 1, class_name = '')
    html = '<div class="col-sm-'.+num.to_s+' '+class_name+'">'
    html.html_safe
  end

  def bootstrap_col_6 (class_name = '')
    html = '<div class="col-sm-6 '+class_name+'">'
    html.html_safe
  end

  def bootstrap_col_12 (class_name = '')
    html = '<div class="col-sm-12 '+class_name+'">'
    html.html_safe
  end

  def bootstrap_row (class_name = '')
    html = '<div class="row '+class_name+'">'
    html.html_safe
  end

  def bootstrap_message (type)
    html = '<div class="alert alert-'+type+'" role="'+type+'">'
    html.html_safe
  end

  def bootstrap_close (num = 1)
    html = ''
    num.times do
      html += '</div>'
    end
    html.html_safe
  end

  def bootstrap_grid_start (col_num = 6,  col_class_name = '', row_class_name = '')
    html = bootstrap_row row_class_name
    html += bootstrap_col col_num, col_class_name
    html.html_safe
  end

  def bootstrap_grid_next (col_num = 6,  class_name = '')
    html = bootstrap_close
    html += bootstrap_col col_num, class_name
    html.html_safe
  end

  def bootstrap_grid_close
    bootstrap_close 2;
  end

  def bootstrap_lower_menu (num = 2)
    html = bootstrap_row
    html += bootstrap_col num, CSS_LOWER_MENU
    html.html_safe
  end

  def bootstrap_lower_menu_close
    bootstrap_close 2
  end

  def bootstrap_page_header
    html = bootstrap_row
    html += bootstrap_col 12, CSS_PAGE_HEADER
    html.html_safe
  end

  def bootstrap_page_header_close
    bootstrap_close 2
  end

  def bootstrap_list
    html = bootstrap_row
    html += bootstrap_col_12 CSS_LIST_CONTAINER
    html += '<ul>'.html_safe
    html.html_safe
  end

  def bootstrap_list_close
    html = '</ul>'.html_safe
    html += bootstrap_close 2
    html.html_safe
  end

  def h1(text, class_name = '')
    html = '<h1 class="'+class_name+'">'+text+'</h1>'
    html.html_safe
  end

  def p(text, class_name = '')
    html = '<p class="'+class_name+'">'+text+'</p>'
    html.html_safe
  end

  def div(text, class_name = '')
    html = '<div class="'+class_name+'">'+text+'</div>'
    html.html_safe
  end

  def li(text, class_name = '')
    html = '<li class="'+class_name+'">'+text+'</li>'
    html.html_safe
  end

  def lbl(text, class_name = '')
    html = '<label class="'+class_name+'">'+text+'</label>'
    html.html_safe
  end

  def preview(text, class_name = '')
    html = '<div class="preview '+class_name+'" disabled="disabled">'+text.html_safe+'</div>'
    html.html_safe
  end

  def bool_t (boolean)
     boolean ? 'Так' : 'Ні'
  end

  def ck_editor
    javascript_include_tag '/ckeditor/ckeditor.js', '/ckeditor/init.js'
  end

end