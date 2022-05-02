#DFD del problema en https://www.figma.com/file/4zk7ovI4qzY6YKHfXr8tnP/Untitled?node-id=0%3A1

def is_number(number)
    if number.match(/^-?(\d|[1-9]+\d*|\.\d+|0\.\d+|[1-9]+\d*\.\d+)$/) == nil
        return false
    end
    return true
end


#Validar cantidad de parametros
if ARGV.length != 2
    puts "ERROR: Se requieren 5 parametros: gravedad del planeta y radio del planeta en [KM]"
    exit
end

#validar que sean float
if !is_number(ARGV[0]) or !is_number(ARGV[1])
    puts "ERROR: Los parametros deben ser numericos"
    exit
end

grav=ARGV[0].to_f
rad=ARGV[1].to_f

#multiplico x 1000 para llevar los KM a Metros
ve= Math.sqrt(2 * grav * rad * 1000)

puts "La velocidad de escape para el planeta es #{ve.round(1)}"
