require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDERR)

require_relative 'db_config'
require_relative 'models/user'
require_relative 'models/leader'
require_relative 'models/vote'
binding.pry
