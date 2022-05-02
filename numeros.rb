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
    numeros.push(i.to_f)
end

x=0
while x < numeros[0].to_i
    y=0
    z=0
    while y <= x
        y += 1
        z += 1
        if z > 9
            z=0
        end
        print z
    end
    puts ""
    x += 1
end
