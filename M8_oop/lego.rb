class Lego
    attr_accessor :size

    def initialize(size=1)
        @size = size
    end

    def +(lego)
        #Lego.new(@size + lego.size)
        @size += lego.size
    end
end

puts Lego.new(2) + Lego.new()
