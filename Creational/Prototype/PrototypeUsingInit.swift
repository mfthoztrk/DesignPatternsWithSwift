protocol Copying {
    init(copiedFrom object: Self)
}

class Engine: CustomStringConvertible, Copying {
    var volume: Double
    var horsepower: Int
    var fuel: String

    init(volume: Double, horsepower: Int, fuel: String) {
        self.volume = volume
        self.horsepower = horsepower
        self.fuel = fuel
    }

    required init(copiedFrom object: Engine) {
        volume = object.volume
        horsepower = object.horsepower
        fuel = object.fuel
    }

    var description: String {
        "\(volume) L and \(horsepower) hp \(fuel) engine"
    }
}

class Car: CustomStringConvertible {
    var brand: String
    var model: String
    var engine: Engine

    init(brand: String, model: String, engine: Engine) {
        self.brand = brand
        self.model = model
        self.engine = engine
    }

    required init(copiedFrom object: Car) {
        // 1st way
        // brand = object.brand
        // model = object.model
        // engine = Engine(volume: object.engine.volume,
        //                 horsepower: object.engine.horsepower,
        //                 fuel: object.engine.fuel)

        // 2nd way
        brand = object.brand
        model = object.model
        engine = Engine(copiedFrom: object.engine)
    }

    var description: String {
        "\(brand) \(model) with \(engine.description)"
    }
}

let carNumber1 = Car(brand: "Mercedes", model: "E 200", engine: Engine(volume: 2.0, horsepower: 204, fuel: "Petrol"))

// If we create copy of "carNumber1" as "carNumber2"
let carNumber2 = Car(copiedFrom: carNumber1)
carNumber2.brand = "BMW"
carNumber2.model = "5.20d"
carNumber2.engine = Engine(volume: 2.0, horsepower: 197, fuel: "Diesel")

print(carNumber1) // Prints Mercedes E 200 with 2.0 L and 204 hp Petrol engine
print(carNumber2) // Prints BMW 5.20d with 2.0 L and 197 hp Diesel engine
