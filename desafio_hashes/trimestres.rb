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

trimestres={"Q1" => 0,"Q2" => 0,"Q3" => 0,"Q4" => 0}

ventas.each do |key,val|
    case key
    when :Enero,:Febrero,:Marzo
        trimestres["Q1"]+=val
    when :Abril,:Mayo,:Junio
        trimestres["Q2"]+=val
    when :Julio,:Agosto,:Septiembre
        trimestres["Q3"]+=val
    when :Octubre,:Noviembre,:Diciembre
        trimestres["Q4"]+=val
    end
end

pp trimestres
