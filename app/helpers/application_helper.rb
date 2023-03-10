# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(description, url_path)
    link_to description, "https://github.com#{url_path}", target: '_blank', rel: 'noopener'
  end
end
