require 'csv'

def nota_mas_alta(notas)
    notas.delete_at(0)
    return notas.max()
end

data = CSV.open('notas.data', converters: :numeric)
          .readlines

data.each do |alumno|
    nota=nota_mas_alta(alumno)
    pp nota
end
