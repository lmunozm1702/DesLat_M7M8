def is_number(number)
    if number.match(/^-?(\d|[1-9]+\d*|\.\d+|0\.\d+|[1-9]+\d*\.\d+)$/) == nil
        return false
    end
    return true
end



#Validar cantidad de parametros
if ARGV.length != 3
    puts "ERROR: Se requieren 3 parametros: precio, usuarios y gastos"
    exit
end

#validar que sean float
if !is_number(ARGV[0]) or !is_number(ARGV[1]) or !is_number(ARGV[2])
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
