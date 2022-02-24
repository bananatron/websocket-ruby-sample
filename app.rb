require 'em-websocket'

puts 'App.rb launching...'

EventMachine::WebSocket.start(:host => "0.0.0.0", :port => 8080) do |ws|

  ws.onopen { |handshake|
    puts "WebSocket connection open"

    # Access properties on the EM::WebSocket::Handshake object, e.g.
    # path, query_string, origin, headers

    # Publish message to the client
    ws.send "Hello Client, you connected to #{handshake.path}"
  }

  ws.onmessage { |msg| ws.send "Pong: #{msg}" }
  ws.onclose   { puts "WebSocket closed!!" }

  ws.onerror { |error|
    if error.kind_of?(EM::WebSocket::WebSocketError)
      raise "ERROR????"
    end
  }
end