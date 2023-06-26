typealias Gram = Double

class Rice {
    let rice: Gram
    let oil: Gram
    let water: Gram
    let salt: Gram

    private init(rice: Gram, oil: Gram, water: Gram, salt: Gram) {
        self.rice = rice
        self.oil = oil
        self.water = water
        self.salt = salt
    }

    private init(readyToEatPacket: Gram) {
        rice = readyToEatPacket * 0.6
        oil = readyToEatPacket * 0.1
        water = readyToEatPacket * 0.38
        salt = readyToEatPacket * 0.02
    }

    static let factory = RiceFactory.instance

    class RiceFactory {
        private init() {}
        static let instance = RiceFactory()

        func createFromRawRice(rice: Gram, oil: Gram, water: Gram, salt: Gram) -> Rice {
            return Rice(rice: rice, oil: oil, water: water, salt: salt)
        }

        func createFromPackagedRice(readyToEatPacket: Gram) -> Rice {
            return Rice(readyToEatPacket: readyToEatPacket)
        }
    }
}

let rice = Rice.factory.createFromRawRice(rice: 100, oil: 10, water: 200, salt: 5)
print(rice.rice) // Prints "100"
