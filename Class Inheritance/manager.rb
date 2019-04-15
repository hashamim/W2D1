require_relative "employee.rb"

require "byebug"


class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary, boss)
        super
        @employees = []       
    end

    def bonus(multiplier)
        # @employees.inject(0){|acc, employee| acc + employee.salary }
        # return 0 unless self.is_a?(Manager)
        # @employees.inject(0) do |acc, emp|
        #     acc + (emp.salary * multiplier) + emp.bonus(multiplier)
        # end
        self.b_helper * multiplier
    end

    def b_helper
        res = 0
        @employees.each do |employ|
            res += employ.salary 
            if employ.is_a?(Manager)
                res += self.b_helper
            end
        end
        res
    end

    # debugger
end

ned = Manager.new("ned", "Founder", 1000000, nil)
darren = Manager.new("darren", "TA Manager", 78000, ned)
david = Employee.new("david", "TA", 10000, darren)
shawna = Employee.new("shawna", "TA", 12000, darren)
# debugger
ned.name