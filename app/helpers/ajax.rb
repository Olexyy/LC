module AJAX
  def ajax_draggable_list (collection, path)
    items = ''
    if collection.blank?
      items += '<p class="lead">' + t(:list_empty) + '</p>'
    else
      collection.each do |i|
        items += '<li draggable="true" id=' + i.id.to_s + '><a draggable="false" id=' + i.id.to_s + '  href="'+ path + i.id.to_s + '">' + i.name + '</a></li>'
      end
    end
    items.html_safe
  end

  def ajax_command (type, target = '', content = '')
    object = Hash.new
    object['command'] = type
    object['target'] = target
    object['content'] = content
    object
  end

end