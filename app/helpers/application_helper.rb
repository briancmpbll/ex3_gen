# Helpers for the application.
module ApplicationHelper
  BASE_TITLE = 'Exalted Generator'

  # Concatenates the base title with the given title or just returns
  # the base title if no title is given.
  def full_title(page_title = '')
    page_title.empty? ? BASE_TITLE : "#{BASE_TITLE} | #{page_title}"
  end

  # Renders an error message display for the given object.
  def display_errors(object)
    render partial: 'shared/error_messages', locals: { object: object }
  end

  # Returns true if the action being performed is an edit or update.
  def edit_action?
    %w(edit update).include? params[:action]
  end

  # Sets the title for the page.
  def provide_title(title)
    provide :title, title
  end

  # Renders pagination links for the given collection.
  def paginate(collection)
    will_paginate collection, renderer: BootstrapPagination::Rails
  end
end
