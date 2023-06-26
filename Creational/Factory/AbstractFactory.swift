protocol FourWheelerVehicle {
    func drive()
}

class Car: FourWheelerVehicle {
    func drive() {
        print("Car is driven")
    }
}

class Truck: FourWheelerVehicle {
    func drive() {
        print("Truck is driven")
    }
}

protocol TwoWheelerVehicle {
    func ride()
}

class Motorcycle: TwoWheelerVehicle {
    func ride() {
        print("Motorcycle is ridden")
    }
}

class Scooter: TwoWheelerVehicle {
    func ride() {
        print("Scooter is ridden")
    }
}

protocol VehicleFactory {
    func manufactureFourWheelerVehicle() -> FourWheelerVehicle
    func manufactureTwoWheelerVehicle() -> TwoWheelerVehicle
}

class XBrandFactory: VehicleFactory {
    func manufactureFourWheelerVehicle() -> FourWheelerVehicle {
        print("Car has been manufactured")
        return Car()
    }

    func manufactureTwoWheelerVehicle() -> TwoWheelerVehicle {
        print("Motorcycle has been manufactured")
        return Motorcycle()
    }
}

class YBrandFactory: VehicleFactory {
    func manufactureFourWheelerVehicle() -> FourWheelerVehicle {
        print("Truck has been manufactured")
        return Truck()
    }

    func manufactureTwoWheelerVehicle() -> TwoWheelerVehicle {
        print("Scooter has been manufactured")
        return Scooter()
    }
}

class ABCMotorVehicles {
    private var brand: String
    private var vehicleFactory: VehicleFactory?

    init(brand: String) {
        self.brand = brand
    }

    private func initVehicleFactory() {
        if brand == "X" {
            vehicleFactory = XBrandFactory()
        } else {
            vehicleFactory = YBrandFactory()
        }
    }

    func manufactureFourWheelerVehicle() -> FourWheelerVehicle {
        initVehicleFactory()
        return vehicleFactory!.manufactureFourWheelerVehicle()
    }

    func manufactureTwoWheelerVehicle() -> TwoWheelerVehicle {
        initVehicleFactory()
        return vehicleFactory!.manufactureTwoWheelerVehicle()
    }
}

var company = ABCMotorVehicles(brand: "X")
let productA1 = company.manufactureFourWheelerVehicle() // Prints "Car has been manufactured"
productA1.drive() // Prints "Car is driven"
let productB1 = company.manufactureTwoWheelerVehicle() // Prints "Motorcycle has been manufactured"
productB1.ride() // Prints "Motorcycle is ridden"

company = ABCMotorVehicles(brand: "Y")
let productA2 = company.manufactureFourWheelerVehicle() // Prints "Truck has been manufactured"
productA2.drive() // Prints "Truck is driven"
let productB2 = company.manufactureTwoWheelerVehicle() // Prints "Scooter has been manufactured"
productB2.ride() // Prints "Scooter is ridden"
