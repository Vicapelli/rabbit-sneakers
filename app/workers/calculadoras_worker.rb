=begin class CalculadoraWorker
  include Sneakers::Worker

  #this worker connect to "dashboard.posts" queue
  #env is set to nil by default the actuall queue name would be dashboard.posts_development
  from_queue "dashboard.soma", env: nil

  def work(raw_soma)
    RecentSomas.push(raw_soma)
    ack!
  end 

end =end