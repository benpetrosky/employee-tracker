ENV['RACK_ENV'] = 'test'

require('rspec')
require("pg")
require("sinatra/activerecord")
require("division")
require("employee")

# RSpec.configure do |config|
#   config.after(:each) do
#   end
# end
