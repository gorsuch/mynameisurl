require 'curb'
require 'json'
require 'redis'

class Worker
  def curl
    @@curl ||= Curl::Easy.new
  end

  def redis
    @@redis ||= Redis.new
  end

  def run
    while true do
      (queue, json) = redis.blpop('urlist', 0)
      data = JSON.parse(json)
      url = data['url']
      curl.url = url
      curl.perform
      status = curl.response_code
      response = { url: url, status: status }
      redis.rpush(data['reply_to'], response.to_json)
      p response
    end
  end
end

Worker.new.run