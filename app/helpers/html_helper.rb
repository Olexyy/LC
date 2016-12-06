module HtmlHelper
  #paths for partials
  PATH_MESSAGE = '/layouts/message'
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
    html += bootstrap_col_12 HtmlHelper::CSS_LIST_CONTAINER
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

  def labl(text, class_name = '')
    html = '<label class="'+class_name+'">'+text+'</label>'
    html.html_safe
  end

end