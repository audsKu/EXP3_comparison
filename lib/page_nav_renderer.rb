class PageNavRenderer < WillPaginate::ActionView::LinkRenderer
  protected

  def html_container(html)
    tag(:ul, html, container_attributes)
  end

  def page_number(page)
    tag :li, page, :class => ('current' if page == current_page)
  end

  def gap
    tag :li, link(super, '#'), :class => 'unavailable'
  end

  def previous_or_next_page(page, text, classname)
    tag :li, text || '#', :class => [classname[0..3], classname, ('unavailable' unless page)].join(' ')
  end
end
