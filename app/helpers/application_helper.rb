module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: :blank
  end

  def transfer_flash_alerts(key)
    alerts = { alert: 'danger', notice: 'primary' }
    alerts[key.to_sym] || key
  end
end
