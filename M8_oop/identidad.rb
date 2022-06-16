class Persona
    attr_accessor :nombre

    def initialize(nombre)
        @nombre = nombre
    end
end

p1 = Persona.new("Trinidad")
p2 = Persona.new("Trinidad")

puts p1==p2
