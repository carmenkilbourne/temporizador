def get_timers(node_count)
  timers = []
  base_time = Time.now.to_f
  node_count.times do |i|
    desfase = rand(-120..120) 
    timer = base_time + desfase
    formatted = Time.at(timer).strftime("%H:%M:%S %d/%m")
    puts "Nodo #{i + 1} obtiene timer: #{formatted}"
    timers << timer
  end
  timers
end
def sincronizar_berkeley(timers)
  promedio = timers.sum / timers.size
  timers.each_with_index do |timer, i|
    factor = promedio - timer
    puts "Nodo #{i+1} debe ajustar su reloj en: #{factor.round(2)} segundos"
  end
  promedio 
end

