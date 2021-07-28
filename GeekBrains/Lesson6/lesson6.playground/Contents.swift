import UIKit


protocol Coffee {
    var cost: Int{get set} // цена кофе
}

class SimpleCoffe: Coffee {
    var cost: Int = 50
}

protocol CoffeeDecorator: Coffee {
    var coffee: Coffee {get set}
}

class Milk: CoffeeDecorator {
    var coffee: Coffee
    
    var cost: Int = 20
    
    init(coffee: Coffee) {
        self.cost = cost + coffee.cost
        self.coffee = coffee
    }
    
}

class Whip: CoffeeDecorator {
    var coffee: Coffee
    var cost: Int = 10
    init(coffee: Coffee) {
        self.cost = cost + coffee.cost
        self.coffee = coffee
    }
    
    
}


class Sugar: CoffeeDecorator {
    var coffee: Coffee
    var cost: Int = 5
    init(coffee: Coffee) {
        self.cost = cost + coffee.cost
        self.coffee = coffee
    }
    
}

let coffee = SimpleCoffe()
let milkCoffee = Milk(coffee: coffee)
let sugarCoffee = Sugar(coffee: milkCoffee)
print("Цена кофе с сахаром и молоком: \(sugarCoffee.cost)")
let whipCoffe = Whip(coffee: milkCoffee)
print("Цена кофе с молоком и сливками: \(whipCoffe.cost)")
