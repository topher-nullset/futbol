require 'simplecov'
SimpleCov.start

require 'csv'
require './lib/team'
require './lib/game'
require './lib/game_team'
require './lib/raw_stats'
require './lib/stat_tracker'

RSpec.configure do |config|
  config.formatter = :documentation
end
