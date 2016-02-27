# Helpers for the application.
module ApplicationHelper
  BASE_TITLE = 'Exalted Generator'

  def full_title(page_title = '')
    page_title.empty? ? BASE_TITLE : "#{BASE_TITLE} | #{page_title}"
  end
end
