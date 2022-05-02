def is_number(number)
    if number.match(/^-?(\d|[1-9]+\d*|\.\d+|0\.\d+|[1-9]+\d*\.\d+)$/) == nil
        return false
    end
    return true
end

#Validar cantidad de parametros
if ARGV.length != 1
    puts "ERROR: Se requiere 1 parametro"
    exit
end

#validar que sean float
numeros=[]
for i in ARGV
    if !is_number(i)
        puts "ERROR: El parametros debe ser numericos"
        exit
    end
    numeros.push(i.to_i)
end

j=0
for i in (1..numeros[0])
    j+=1
    print j
    if j==3
        j=0
    end
end
