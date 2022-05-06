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

ventas_mayores = ventas.select { |key,val| val > 45000 }
#pp ventas_mayores.values
ventas_mayores.each do |key,val|
    puts val
end
