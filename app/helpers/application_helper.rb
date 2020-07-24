module ApplicationHelper
  # rubocop:disable all
  def full_title(page_title = '')
  # rubocop:enable all
    base_title = 'House Coffee'
    if page_title.blank?
      base_title
    else
      "#{page_title} - #{base_title}"
    end
  end
end
