=begin class RecentSomas
    KEY = "recent_somas" #Redis key
    STORE_LIMIT = 5 #how many posts should be kept
  
    #get list of recent posts from redis
    #we need to parse each list item as JSON
    def self.list(limit = STORE_LIMIT)
      $redis.lrange(KEY, 0, limit-1).map do |raw_soma|
        JSON.parse(raw_soma).with_indifferent_access
      end
    end
  
    #Push a new post to list and trim its size
    def self.push(raw_soma)
      $redis.lpush(KEY, raw_soma)
      $redis.ltrim(KEY, 0, STORE_LIMIT-1)
    end
  end =end