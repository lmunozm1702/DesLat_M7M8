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

class Recta
    def initialize (p1,p2)
        @p1=p1
        @p2=p2
    end
end

a=Recta.new(Punto.new(2,3),Punto.new(3,4))
puts a
