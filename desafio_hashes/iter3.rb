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

def filtro (ventas)
    filtrado={}
    ventas.each do |key,val|
        filtrado[key]=val
    end
    return filtrado
end

#Valida la cantidad de parámetros ingresados
valida_argv(ARGV,1)

#Valida que el parametro sea numericos
if !is_number(ARGV[0])
    puts "El parametro debe ser numérico"
    exit
end

pp filtro(ventas.select { |key,val| val > ARGV[0].to_i })
