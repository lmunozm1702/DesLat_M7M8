class Persona
    def initialize(nombre, caminado=0)
        @nombre = nombre
        @caminado = caminado
    end

    def caminar (km=1)
        Persona.new(@nombre, @caminado + km)
    end

    def caminado
        @caminado
    end
end

p1 = Persona.new("Daniel")
p2 = p1.caminar(10)
puts p2
