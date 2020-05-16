require 'socket'

server = TCPServer.new('0.0.0.0', 3000)

loop do
  client  = server.accept
  headers = []
  while header = client.gets
    break if header.chomp.empty?
    headers << header.chomp
  end

  client.puts "HTTP/1.0 200 OK"
  client.puts "Content-Type: text/plain"
  client.puts
  client.puts "message body"

  ENV.each do |key, value|
    client.puts "#{key} = #{value}"
  end
  client.close
end