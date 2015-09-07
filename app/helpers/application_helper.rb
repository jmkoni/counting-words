module ApplicationHelper
  def active_path(*paths)
    paths = [paths].flatten
    paths.inject(false){|cond, path| cond or current_page?(send(path))} ? 'active' : nil
  end

  def new_url_active
    'active' if (controller.controller_name == 'scraped_urls' && controller.action_name == 'new')
  end

  def home_active
    active_path('root_path') ||
      ('active' if (controller.controller_name == 'scraped_urls' && controller.action_name == 'index'))
  end

  def show_url_active
    'active' if (controller.controller_name == 'scraped_urls' && controller.action_name == 'show')
  end
end