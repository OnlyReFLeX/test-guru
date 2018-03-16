module ApplicationHelper
  ALERTS = { alert: 'danger', notice: 'primary' }.freeze

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: :blank
  end

  def alert_manager(key)
    ALERTS[key.to_sym] || key
  end
end
