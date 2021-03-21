require 'pry'

class Customer
    attr_accessor :name, :age

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def meals
        Meal.all.select {|meal| meal.customer == self}
    end

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end

    def waiters
        meals.map do |meal|
          meal.waiter
        end
    end
end