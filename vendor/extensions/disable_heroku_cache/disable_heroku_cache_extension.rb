# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class DisableHerokuCacheExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/disable_heroku_cache"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :disable_heroku_cache
  #   end
  # end
  
  def activate
    # admin.tabs.add "Disable Heroku Cache", "/admin/disable_heroku_cache", :after => "Layouts", :visibility => [:all]
    ApplicationController.class_eval {
      after_filter :disable_cache
      private
      def disable_cache
        headers['Cache-Control'] = 'no-cache'
      end
    }
  end
  
  def deactivate
    # admin.tabs.remove "Disable Heroku Cache"
  end
  
end
