require 'digest'    							# For hash checksum digest function SHA256
require 'pp'        							# For pp => pretty printer
require_relative 'Nodo'					# class Nodo
require_relative 'funciones'		# method funcioness

LEDGER = []						#registro
def crear_nodos(n_nodos)
  timers = get_timers(n_nodos)
	 avg=sincronizar_berkeley(timers)
	   puts "La hora correcta según el método de Berkley: #{Time.at(avg).strftime("%H:%M:%S %d/%m")}"
 nodes = []
  n_nodos.times do |i|
    node = Nodo.new(i + 1, timers[i])
    nodes << node
  end

  nodes.each do |node|
    puts "Nodo #{node.id} ajusta su timer : #{Time.at(avg).strftime("%H:%M:%S %d/%m")}"
    node.instance_variable_set(:@timer, avg)
  end
end
	

def launcher
	puts "==========================="
	puts ""
	puts "Algoritmo de Berkley"
	puts ""
	for i in 1..10
		print "."
		sleep 0.1
		break if i == 10
	end
	puts "" 
	puts "" 
	puts "==========================="
	print "¿Cuántos nodos quieres crear? "
  n = gets.chomp.to_i
  crear_nodos(n)
end

launcher
