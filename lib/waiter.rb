class Waiter
    attr_accessor :name, :years

    @@all = []

    def initialize(name, years)
        @name = name
        @years = years
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
          meal_a.tip <=> meal_b.tip
        end
        best_tipped_meal.customer
    end
end