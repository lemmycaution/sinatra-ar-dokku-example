n = (_n = ARGV[0].to_i) > 0 ? _n : 100

puts "#{n} times requesting HTTP GET http://testar.actn.io"

n.times do
  fork do
    `curl http://testar.actn.io`
  end
end