module Nadador
    def nadar
        puts "Puedo nadar!"
    end
end

class Gato
end

class Perro
    extend Nadador
end

#bobby = Perro.new
#puts bobby.nadar

puts Perro.nadar
