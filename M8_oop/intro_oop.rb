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
    attr_accessor :ancho, :alto
end

c = Caja.new()
c.ancho = 2
c.alto = 3
puts c.ancho,c.alto

#-----

class Experimento
    attr_reader :a
    attr_writer :b
end

exp = Experimento.new
exp.a
# exp.a = 5 #error
exp.b = 5


#---
class Ejemplo
    def initialize(a)
        puts(a)
    end
end

Ejemplo.new(5)
Ejemplo.new('hola')

class Semaforo
    def initialize(estado)
        @estado=estado
        puts @estado
    end
end

s1=Semaforo.new(:rojo)
s2=Semaforo.new(:verde)

class Mascota
    attr_accessor :nombre
    def initialize(nombre)
        @nombre=nombre #variable de instancia
    end
end

primera_mascota = Mascota.new("Spike")
puts primera_mascota.nombre

class Persona
    def initialize
        @nombre = ""
        @edad = 0
    end
    def saludar()
        puts "hola" + @nombre
    end
end

luis = Persona.new()
luis.saludar

class Casa
    def initialize (pisos = 1)
        @pisos = pisos
    end
end

casa1 = Casa.new
casa2 = Casa.new(2)

#---
class Producto
    def initialize(name, stock=0)
        @name=name
        @stock=stock
    end
end

#---
class Punto
    attr_reader :x,:y
    def initialize(x,y)
        @x=x
        @y=y
    end
    def avanzar()
        @x += 1
    end
end

p1=Punto.new(2,3)
p1.avanzar
