# encoding: UTF-8

class PaginateButtonRenderer < WillPaginate::ActionView::LinkRenderer
  def to_html
    html = ''
    html += tag("a", " Top", :href => "#{url(current_page + 1)}&tester_response=1", :class => 'button large radius success') if current_page < total_pages
    html += tag("a", "Bottom", :href => "#{url(current_page + 1)}&tester_response=2", :class => 'button large radius success') if current_page < total_pages
    html
  end
end
