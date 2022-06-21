class Person
    def initialize(first, last, age)
        @first_name = first
        @last_name = last
        @age = age
    end

    def birthday
        @age += 1
    end

    def introduce
        "Mi nombre es #{@first_name} #{@last_name}."
    end


end

class Student < Person
    def talk
        puts "Aquí es la clase de programación con Ruby?"
    end
    def introduce
        puts "Hola Profesor. " + super
    end
end

class Teacher < Person
    def talk
        puts "Bienvenidos a la clase de programación con Ruby!"
    end
    def introduce
        puts "Hola Alumnos. " + super
    end
end

class Parent < Person
    def talk
        puts "Aquí es la reunión de apoderados?"
    end
    def introduce
        puts "Hola. Soy uno de los apoderados. " + super
    end
end

luis = Parent.new("Luis","Munoz",46)
luis.introduce
luis.talk

cristobal = Teacher.new("Cristobal","Dominguez",40)
cristobal.introduce
cristobal.talk

benjamin = Student.new("Benjamin","Munoz",15)
benjamin.introduce
benjamin.talk
