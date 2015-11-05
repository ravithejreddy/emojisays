require 'active_record'

options ={
  adapter: 'postgresql',
  database: 'emoji'
}

ActiveRecord::Base.establish_connection(options)
