require "bunny"


module Consumer
  class Reciever

    conn = Bunny.new
    conn.start

    ch = conn.create_channel

    q = ch.queue("soma")

    @sum = 0

    q.subscribe(:block => true, :manual_ack => true) do |delivery_info, metadata, payload|
        puts "subscriber recebeu número #{payload.to_i}"

        sum = @sum += payload.to_i

        if sum == payload.to_i
          puts "Não tem numero para somar"
        else
          puts "Somando com o 1 número, o resultado é: #{sum}"
        end

        ch.ack(delivery_info.delivery_tag)
    end
    conn.stop
  end
end