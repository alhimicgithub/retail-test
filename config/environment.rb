# Load the Rails application.
require File.expand_path('../application', __FILE__)

ActiveRecord::Base.logger.level = Logger::DEBUG
# Initialize the Rails application.
Rails.application.initialize!
