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

letras = ("a".."z").to_a

numeros[0].to_i.times { |i| print "#{letras[i]}" }

puts "\n"

### Opcion con next
i=0
letras_enum = letras.to_enum
while i < numeros[0]
    print letras_enum.next
    i += 1
end
