require "bunny"
require 'json'

module Consumer
  class Reciever

    conn = Bunny.new
    conn.start

    ch = conn.create_channel

    q = ch.queue("soma")


    q.subscribe(:block => true, :manual_ack => true) do |delivery_info, metadata, payload|
        puts "subscriber recebeu número #{payload}"

        body = JSON.parse(payload)
        result = body['first_number'] + body['second_number']

        puts "Somando com o 1 número, o resultado é: #{result}"

        ch.ack(delivery_info.delivery_tag)
    end
    conn.stop
  end
end