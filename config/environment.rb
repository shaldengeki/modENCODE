# Load the rails application
require File.expand_path('../application', __FILE__)

ModENCODE::Application.configure do
  config.time_zone = "Central Time (US & Canada)"
end

# Initialize the rails application
ModENCODE::Application.initialize!