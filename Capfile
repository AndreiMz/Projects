require 'capistrano/setup'
require 'capistrano-bundler'
require 'capistrano/rails'
require 'capistrano/deploy'
require 'capistrano-rbenv'

set :ssh_options, forward_agent: true
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
