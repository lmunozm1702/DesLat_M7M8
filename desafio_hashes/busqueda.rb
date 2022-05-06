require './utilidades.rb'

ventas = {
Enero: 15000,
Febrero: 22000,
Marzo: 12000,
Abril: 17000,
Mayo: 81000,
Junio: 13000,
Julio: 21000,
Agosto: 41200,
Septiembre: 25000,
Octubre: 21500,
Noviembre: 91000,
Diciembre: 21000
}

#Valida la cantidad de parámetros ingresados [0]: validar al menos 1 
valida_argv(ARGV,0)

#Valida que el parametro sea numericos
valida_argv_numeros(ARGV)

ARGV.each do |valor|
    resultados = ventas.select { |key,val| val == valor.to_i }
    if resultados.length > 0
        resultados.each { |key,val| puts "#{valor}: #{key}"}
    else
        puts "#{valor}: no encontrado"
    end
end
