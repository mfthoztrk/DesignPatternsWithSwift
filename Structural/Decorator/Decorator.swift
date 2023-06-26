protocol Vehicle: CustomStringConvertible {
    var description: String { get }
    func price() -> Int
}

class Car: Vehicle {
    var description: String = "Car"
    
    func price() -> Int {
        25000
    }
}

class TechnologyDecorator: Vehicle {
    var vehicle: Vehicle
    var hasParkAssist: Bool
    var hasCruiseControl: Bool
    
    init(vehicle: Vehicle,
         hasParkAssist: Bool,
         hasCruiseControl: Bool) {
        self.vehicle = vehicle
        self.hasParkAssist = hasParkAssist
        self.hasCruiseControl = hasCruiseControl
    }
    
    var description: String {
        "\(vehicle.description) with \(hasParkAssist ? "Park Assist" : ""), \(hasCruiseControl ? "Cruise Control" : "")"
    }
    
    func price() -> Int {
        vehicle.price() + (hasParkAssist ? 2000 : 0) + (hasCruiseControl ? 1500 : 0)
    }
}

class ColorDecorator: Vehicle {
    var vehicle: Vehicle
    var color: String
    
    init(vehicle: Vehicle, color: String) {
        self.vehicle = vehicle
        self.color = color
    }
    
    var description: String {
        "\(vehicle.description) with \(color) color"
    }
    
    func price() -> Int {
        vehicle.price() + 500
    }
}

let car = Car()
print(car) // Prints Car
print(car.price()) // Prints 25000

let technologicalCar = TechnologyDecorator(vehicle: car,
                                           hasParkAssist: true,
                                           hasCruiseControl: true)
print(technologicalCar) // Prints Car with Park Assist, Cruise Control
print(technologicalCar.price()) // Prints 28500

let blackTechnologicalCar = ColorDecorator(vehicle: technologicalCar,
                                           color: "Black")
print(blackTechnologicalCar) // Prints Car with Park Assist, Cruise Control with Black color
print(blackTechnologicalCar.price()) // Prints 29000
