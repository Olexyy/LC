module HtmlHelper
  #paths for partials
  PATH_MESSAGE = '/layouts/message'
  #css classes
  CSS_LOWER_MENU = 'lower-menu'
  CSS_PAGE_HEADER = 'page-header'
  CSS_LEAD = 'lead'
  CSS_TEASER_TEXT = 'teaser-text'
  CSS_ITEM_LIST = 'item-list'

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

  def bootstrap_close
    html = '</div>'
    html.html_safe
  end

  def bootstrap_lower_menu (num = 2)
    html = bootstrap_col num, CSS_LOWER_MENU
    html += bootstrap_row
    html.html_safe
  end

  def bootstrap_lower_menu_close
    html = bootstrap_close
    html+= bootstrap_close
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

end