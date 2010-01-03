class ApplicationController < ActionController::Base
  before_filter :set_cache_control_header
  def set_cache_control_header
    headers['Cache-Control'] = 'no-cache'
  end
end
