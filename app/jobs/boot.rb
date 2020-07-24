require 'sneakers'
require 'json'
require 'sneakers/runner'

class Processor
  include Sneakers::Worker
  from_queue "soma", durable: false, exchange: "sum"

  def work(payload)
    puts "subscriber recebeu número #{payload}"

    body = JSON.parse(payload)
    result = body['first_number'] + body['second_number']

    puts "Somando com o 1 número, o resultado é: #{result}"

  end
end

# opts = {
#   # what ever you want
# }

# Sneakers.configure(opts)

# r = Sneakers::Runner.new([Processor])

# r.run