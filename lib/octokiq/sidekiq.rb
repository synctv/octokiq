require 'octokiq/middleware/client/database_connection'
require 'octokiq/middleware/server/database_connection'

module Octokiq
  module Sidekiq
    def self.hook_sidekiq!
      ::Sidekiq.configure_client do |config|
        config.client_middleware do |chain|
          chain.add Octokiq::Middleware::Client::DatabaseConnection
        end
      end

      ::Sidekiq.configure_server do |config|
        config.server_middleware do |chain|
          chain.add Octokiq::Middleware::Server::DatabaseConnection
        end
      end
    end
  end

  Sidekiq.hook_sidekiq!
end