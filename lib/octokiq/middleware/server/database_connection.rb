module Octokiq
  module Middleware
    module Server
      class DatabaseConnection
        def call(worker, msg, queue)
          key = msg['database'].hash

          Octokiq.append_database(key, msg['database']) if Octokiq.get_database(key).blank?

          # NOTE: We should hack/monkey Octopus#using here to use the key set above currently it expects 
          # from the shards.yml file
          Octopus.using(key) do
            yield
          end
        end
      end
    end
  end
end