require "pp"

def chart(notas)
    #pp notas.max()
    escala = 2

    notas.each do |nota|
        print "|" + "*" * escala * nota + "\n"
    end

    print ">" + "-" * escala * notas.max() + "\n"

    escala-=1
    print " "
    1.upto(notas.max()) { |i|
        print " " * escala + "#{i}"
    }
end
