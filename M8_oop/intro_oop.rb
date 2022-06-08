#--
class MiPrimeraClase
end
a = MiPrimeraClase.new()
puts a.class


puts [1,2,3,4].include?(2)
puts [1,2,3,4].size()

#--
class Persona
    def saludar
        puts "hola!!"
    end
end

b = Persona.new()
puts b.saludar()

#--
class Perro
    def ladrar
        puts "bark"
    end
end
loky=Perro.new()
simon=Perro.new()

loky.ladrar()
simon.ladrar()

#---
class Vehiculo
    def encender
        @encendido = "on"
    end

    def apagar
        @encendido = "off"
    end

    def estado
        @encendido
    end
end

a1 = Vehiculo.new
a2 = Vehiculo.new
a1.apagar
puts a1.estado
a2.encender
puts a2.estado

#---

class Test
    def foo
        @a=5
    end

    def bar
        puts @a
    end
end

test = Test.new()
test.foo
test.bar

#---
class Mascota
    def initialize(nuevo_nombre)
        @nombre = nuevo_nombre
    end
end

m1 = Mascota.new("Shadow")
#Error forzado, encapsulamiento, no se puede acceder a una variable dentro del método.
#puts m1.nombre

#---
class Caja
    attr_accessor :ancho
end

c = Caja.new()
c.ancho = 2
puts c.ancho
