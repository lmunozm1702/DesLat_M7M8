require 'csv'

def nota_mas_alta(notas)
    notas.delete_at(0)
    return notas.select { |number| number == notas.max() }
end

data = CSV.open('notas.data', converters: :numeric)
          .readlines

nota=[]
data.each do |alumno|
    nota.push(nota_mas_alta(alumno))
    pp nota
end
