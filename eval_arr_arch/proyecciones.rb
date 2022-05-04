require 'csv'
#require 'pp'

###Escribe errores en el archivo de salidas
def escribe_error mensaje
    open('resultados.data', "w") do |archivo|
        archivo.write("#{Time.now.strftime("%Y-%m-%d %H:%M:%S")} - ERROR: #{mensaje}")
    end
end

###Escribe el resultado del cálculo en el archivo de salidas
def escribe_resultados mensaje
    open('resultados.data', "w") do |archivo|
        mensaje.each do |x|
            archivo.write("%0.2f\n" %[x])
        end
    end
end

###Realiza los cálculos
def proyecta_semestre (valores, incremento, inicio, fin)
    sum=0.0
    inicio.upto(fin) { |i| sum += valores[i] }
    return  sum + (sum * incremento / 100)
end

### Main()
data = CSV.open('ventas_base.db', converters: :numeric)
          .readlines

values = data[0]

if values.length != 12
    escribe_error ("Se esperaban 12 valores y se encontraron #{values.length}")
    exit
end

resultados=[]
resultados.push(proyecta_semestre(values,10,0,5))
resultados.push(proyecta_semestre(values,20,6,11))
#pp resultados
escribe_resultados(resultados)
