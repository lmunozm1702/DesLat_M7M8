def is_number(number)
    if number.match(/^-?(\d|[1-9]+\d*|\.\d+|0\.\d+|[1-9]+\d*\.\d+)$/) == nil
        return false
    end
    return true
end

#Validar cantidad de parametros
if ARGV.length != 3 and ARGV.length != 4
    puts "ERROR: Se requieren 3 ó 4 parametros"
    exit
end

#validar que sean float
numeros=[]
for i in ARGV
    if !is_number(i)
        puts "ERROR: Los parametros deben ser numericos"
        exit
    end
    numeros.push(i.to_f)
end

print numeros.sort.last
