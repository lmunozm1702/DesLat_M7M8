Precio = 50
Usuarios = 1000
Gastos = 20000

#Validar cantidad de parametros
if ARGV.length != 3
    puts "ERROR: Se requieren 3 parametros: precio, usuarios y gastos"
    exit
end

#puts "[#{ARGV[0].match(/^-?(\d|[1-9]+\d*|\.\d+|0\.\d+|[1-9]+\d*\.\d+)$/)}]"

if ARGV[0].match(/^-?(\d|[1-9]+\d*|\.\d+|0\.\d+|[1-9]+\d*\.\d+)$/) == nil or
        ARGV[1].match(/^-?(\d|[1-9]+\d*|\.\d+|0\.\d+|[1-9]+\d*\.\d+)$/) == nil or
        ARGV[2].match(/^-?(\d|[1-9]+\d*|\.\d+|0\.\d+|[1-9]+\d*\.\d+)$/) == nil
    puts "ERROR: Los parametros deben ser numericos"
    exit
end

#Asignar parametros
precio = ARGV[0].to_f
usuarios = ARGV[1].to_f
gastos = ARGV[2].to_f

#Calculo utilidad
utilidades = precio * usuarios - gastos

impuesto = 0
#Calculo impuesto
if utilidades > 0
    impuesto = utilidades * 35 / 100
end

puts "Utilidad antes de impuestos (+) : #{utilidades}"
puts "Impuestos                   (-) : #{impuesto}"
puts "Utilidad despues de impuestos   : #{utilidades-impuesto}"
