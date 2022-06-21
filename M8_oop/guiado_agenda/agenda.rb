class Appointment

    def initialize(location, purpose, hour, min)
        @location=location
        @purpose=purpose
        @hour=hour
        @min=min
    end

    def location
        @location
    end

    def purpose
        @purpose
    end

    def hour
        @hour
    end

    def min
        @min
    end
end

class DailyAppointment < Appointment
    def occurs_on?(on_hour,on_min)
        if @hour == on_hour and @min == on_min
            return true
        end
        false
    end

    def to_s
        return "Reunión diaria en #{@location} sobre #{@purpose} a la(s) #{@hour}:#{format('%02d', @min)}."
    end


end

class OneTimeAppointment < Appointment

    def initialize(location, purpose, hour, min, day, month, year)
        @location=location
        @purpose=purpose
        @hour=hour
        @min=min
        @day=day
        @month=month
        @year=year
    end

    def day
        @day
    end

    def month
        @month
    end

    def year
        @year
    end

    def occurs_on?(on_day,on_month,on_year)
        if @day == on_day and @month == on_month and @year == on_year
            return true
        end
        false
    end

    def to_s
        return "Reunión única en #{@location} sobre #{@purpose} el #{@day}/#{@month}/#{@year} a la(s) #{@hour}:#{format('%02d', @min)}."
    end

end

class MonthlyAppointment < Appointment

    def initialize(location, purpose, hour, min, day)
        @location=location
        @purpose=purpose
        @hour=hour
        @min=min
        @day=day
    end

    def day
        @day
    end

    def occurs_on?(on_day)
        if @day == on_day
            return true
        end
        false
    end

    def to_s
        return "Reunión mensual en #{@location} sobre #{@purpose} el día #{@day} a la(s) #{@hour}:#{format('%02d', @min)}."
    end

end

puts OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
puts OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019).occurs_on?(4,6,2019)
puts OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019).occurs_on?(4,6,2018)
puts DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
puts DailyAppointment.new('Desafío Latam', 'Educación', 8, 15).occurs_on?(8,15)
puts DailyAppointment.new('Desafío Latam', 'Educación', 8, 15).occurs_on?(9,16)
puts MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)
puts MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23).occurs_on?(23)
puts MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23).occurs_on?(22)
