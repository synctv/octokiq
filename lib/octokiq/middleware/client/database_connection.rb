module Octokiq
  module Middleware
    module Client
      class DatabaseConnection
        def call(worker, msg, queue)
          msg['database'] = ActiveRecord::Base.connection_config
          yield
        end
      end
    end
  end
end