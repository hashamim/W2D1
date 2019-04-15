class Employee

    attr_reader :salary, :name, :title, :boss

    
    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        @boss.employees << self unless @boss.nil?
    end

    def bonus(multiplier)
        return @salary * multiplier
    end

    
end

