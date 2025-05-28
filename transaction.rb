def get_timers_from_server(node_count)
  timers = []
  node_count.times do |i|
    timer = Time.now.to_f
    formatted = Time.at(timer).strftime("%H:%M:%S %d/%m")
    puts "Nodo #{i + 1} obtiene timer: #{formatted}"
    timers << timer
    sleep(Random.rand()) 
  end
  timers
end

def average_timer(timers)
  avg = timers.sum / timers.size
  Time.at(avg).strftime("%H:%M %d/%m")
end