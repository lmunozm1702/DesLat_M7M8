def is_number(number)
    if number.match(/^-?(\d|[1-9]+\d*|\.\d+|0\.\d+|[1-9]+\d*\.\d+)$/) == nil
        return false
    end
    return true
end

#Validar cantidad de parametros
if ARGV.length != 3
    puts "ERROR: Se requieren 3 parametros"
    exit
end

#validar que sean float
if !is_number(ARGV[0]) or !is_number(ARGV[1]) or !is_number(ARGV[2])
    puts "ERROR: Los parametros deben ser numericos"
    exit
end

#Transformando el tipo de datos a Float
numeros = [ARGV[0].to_f,ARGV[1].to_f,ARGV[2].to_f].sort
print numeros.sort[0]
