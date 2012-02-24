require 'datalogger'
require 'json'
require 'redis'
require 'securerandom'

class Client
  include DataLogger

  def get_result(queue)
    (queue, json) = redis.blpop(queue, 3)
    JSON.parse(json)
  end

  def redis
    @@redis ||= Redis.new
  end

  def run
    while true
      log(action: 'run') do 
        reply_queue = "reply:#{SecureRandom.uuid}"
        redis.rpush(target, { url: url, reply_to: reply_queue }.to_json)
        result = get_result(reply_queue)
        log(action: 'run', url: url, status: result['status'])
      end
    end
  end

  def target
    'urlist'
  end

  def url
    'http://google.com'
  end
end

Client.new.run