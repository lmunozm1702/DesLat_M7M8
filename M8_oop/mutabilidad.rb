class MoldeAuto
    attr_accessor :color
    def initialize()
        @color = "verde"
    end
end

m1 = MoldeAuto.new
puts m1.color

m1.color="rojo"
puts m1.color

m2=m1
m1.color="cafe"
puts m2.color
