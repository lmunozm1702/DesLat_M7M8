module MyMath
    PI = 3.14
    E = 2.78

    def self.sumar(x,y)
        x + y
    end

    def self.restar(x,y)
        x - y
    end

    def self.multiplicar(x,y)
        x * y
    end
end

puts MyMath::PI
puts MyMath::E

puts MyMath.sumar(3,4)
puts MyMath.restar(4,3)
puts MyMath.multiplicar(3,2)
