# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class DisableHerokuCachingExtension < Radiant::Extension
  version "1.0"
  description "disables Heroku's caching of pages (undesirable with Radiant)"
  url "http://devyn.heroku.com/"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :disable_heroku_caching
  #   end
  # end
  
  def activate
    # admin.nav[:content] << admin.nav_item(:disable_heroku_caching, "Disable Heroku Caching", "/admin/disable_heroku_caching"), :after => :pages
  end
end
