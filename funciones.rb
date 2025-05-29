def get_timers(node_count)
  timers = []
  tiempo_actual = Time.now.to_f
  node_count.times do |i|
    desfase = rand(-120..120) 
    timer = tiempo_actual + desfase
    tiempo = Time.at(timer).strftime("%H:%M:%S %d/%m")
    puts "Nodo #{i + 1} obtiene timer: #{tiempo}"
    timers << timer
  end
  timers
end
def sincronizar_berkeley(timers)
  promedio = timers.sum / timers.size
  timers.each_with_index do |timer, i|
    desfase = promedio - timer
    puts "Nodo #{i+1} debe ajustar su reloj en: #{desfase.round(2)} segundos"
  end
  promedio 
end

