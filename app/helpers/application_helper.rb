module ApplicationHelper
  BOOTSTRAP_TAG_6 = '<div class="col-sm-6">' unless defined? BOOTSTRAP_TAG_6
  # key : text => value : controller%id
  def lower_menu (hash)
    output = '<div class="row lower-menu">'+BOOTSTRAP_TAG_6+'<ul>'
      hash.each do |text, action|
        string = text.to_s.gsub '_', ' '
        values = action.split '%'
        if values.count == 1
          output.concat("<li><p>#{link_to string, {:action => action} }</p></li>")
        elsif values.first == 'delete'
          output.concat("<li><p>#{link_to string, {:action => values.first, :id => values.last, :data => { :confirm => 'Are you sure?' } } }</p></li>")
        else
          output.concat("<li><p>#{link_to string, {:action => values.first, :id => values.last} }</p></li>")
        end
      end
    output.concat('</ul></div></div>')
    output.html_safe
  end
end