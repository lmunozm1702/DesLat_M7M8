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

cuenta_regresiva = numeros[0].to_i
puts "Contando desde #{cuenta_regresiva}..."
i=0
while i < cuenta_regresiva
    puts cuenta_regresiva
    cuenta_regresiva -= 1
end
