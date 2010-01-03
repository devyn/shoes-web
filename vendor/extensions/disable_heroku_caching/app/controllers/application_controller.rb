class ApplicationController < ActionController::Base
  after_filter :set_cache_control_header
  private
  def set_cache_control_header
    # disallow any caching
    headers['Cache-Control'] = 'no-cache'
  end
end
