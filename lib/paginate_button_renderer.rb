# encoding: UTF-8

class PaginateButtonRenderer < WillPaginate::ActionView::LinkRenderer
  def to_html
    html = ''
    html += tag("a", "Submit and Go to next comparison", :href => url(current_page + 1), :class => 'button large radius success') if current_page < total_pages
    html
  end
end
