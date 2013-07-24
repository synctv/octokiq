require 'octokiq/version'
require 'thread'

module Octokiq
  @mutex = Mutex.new
  @databases = {}

  def self.databases
    @databases 
  end

  def self.get_database(key)
    @databases[key]
  end

  def self.append_database(key, values)
    @mutex.synchronize { @databases[key] = values }
  end
end

require 'octokiq/sidekiq' if defined?(Sidekiq)