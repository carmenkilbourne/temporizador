require 'digest'    							# For hash checksum digest function SHA256
require 'pp'        							# For pp => pretty printer
# require 'pry'                     # For on the fly debugging
require_relative 'block'					# class Block
require_relative 'transaction'		# method Transactions

LEDGER = []						#registro


def create_nodes_and_sync_time(node_count)
  timers = get_timers_from_server(node_count)
  puts "Timers recibidos: #{timers.inspect}"
  avg = average_timer(timers)
  puts "La hora correcta (media): #{avg}"

  # Crear los nodos con su id y timer individual
  nodes = []
  node_count.times do |i|
    node = Block.new(i + 1, timers[i])
    nodes << node
    puts "Nodo #{node.id} creado con timer #{node.timer}"
  end

  # Devolver la hora sincronizada a cada nodo (simulado)
  nodes.each do |node|
    puts "Nodo #{node.id} ajusta su timer a la hora sincronizada: #{avg}"
    node.instance_variable_set(:@timer, avg)
  end
end
	
	
	
def add_block
	i = 1
	loop do
		instance_variable_set("@b#{i}", Block.next( (instance_variable_get("@b#{i-1}")), get_transactions_data))
		LEDGER << instance_variable_get("@b#{i}")
		p "============================"
		pp instance_variable_get("@b#{i}")
		p "============================"
		i += 1
	end
end

def launcher
	puts "==========================="
	puts ""
	puts "Algoritmo de Christian"
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
  node_count = gets.chomp.to_i
  create_nodes_and_sync_time(node_count)
end

launcher
