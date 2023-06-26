class Car: CustomStringConvertible {
    // Brand
    var brand = ""
    var model = ""
    
    // Color
    var color = ""
    
    // Engine
    var volume = 0.0
    var horsepower = 0
    var cyclinder = 0
    var fuel = ""
    
    var description: String {
        return "\(color) \(brand) \(model) with \(volume) L, \(horsepower) hp, and V\(cyclinder) engine that uses \(fuel)"
    }
}

class CarBrandBuilder: CarBuilder {
    init(_ car: Car) {
        super.init()
        self.car = car
    }

    func brand(_ brand: String) -> CarBrandBuilder {
        car.brand = brand
        return self
    }

    func model(_ model: String) -> CarBrandBuilder {
        car.model = model
        return self
    }
}

class CarEngineBuilder: CarBuilder {
    init(_ car: Car) {
        super.init()
        self.car = car
    }

    func engine(_ volume: Double) -> CarEngineBuilder {
        car.volume = volume
        return self
    }

    func horsepower(_ horsepower: Int) -> CarEngineBuilder {
        car.horsepower = horsepower
        return self
    }

    func cyclinder(_ cyclinder: Int) -> CarEngineBuilder {
        car.cyclinder = cyclinder
        return self
    }

    func uses(_ fuel: String) -> CarEngineBuilder {
        car.fuel = fuel
        return self
    }
}

class CarBuilder {
    var car = Car()
    var runsWith : CarEngineBuilder {
        return CarEngineBuilder(car)
    }
    var its : CarBrandBuilder {
        return CarBrandBuilder(car)
    }

    func color(_ color: String) -> CarBuilder {
        car.color = color
        return self
    }

    func build() -> Car {
        return car
    }
}

let carBuilder = CarBuilder()
let car = carBuilder
    .its
        .brand("Mercedes")
        .model("E 200")
    .runsWith
        .engine(2.0)
        .horsepower(204)
        .cyclinder(4)
        .uses("Petrol")
    .color("Black")
    .build()
print(car)
// Prints
// Black Mercedes E 200 with 2.0 L, 204 hp, and V4 engine that uses Petrol
