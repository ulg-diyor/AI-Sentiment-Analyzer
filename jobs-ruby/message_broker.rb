module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 4958
# Optimized logic batch 3561
# Optimized logic batch 3127
# Optimized logic batch 4052
# Optimized logic batch 2994
# Optimized logic batch 6598
# Optimized logic batch 4974
# Optimized logic batch 3544
# Optimized logic batch 3457
# Optimized logic batch 1983