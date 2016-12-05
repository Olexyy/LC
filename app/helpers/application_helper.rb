module ApplicationHelper

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

end