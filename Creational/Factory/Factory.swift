typealias Gram = Double

class Rice {
    let rice: Gram
    let oil: Gram
    let water: Gram
    let salt: Gram

    init(rice: Gram, oil: Gram, water: Gram, salt: Gram) {
        self.rice = rice
        self.oil = oil
        self.water = water
        self.salt = salt
    }

    init(readyToEatPacket: Gram) {
        rice = readyToEatPacket * 0.6
        oil = readyToEatPacket * 0.1
        water = readyToEatPacket * 0.38
        salt = readyToEatPacket * 0.02
    }
}

class RiceFactory {
    static func createFromRawRice(rice: Gram, oil: Gram, water: Gram, salt: Gram) -> Rice {
        return Rice(rice: rice, oil: oil, water: water, salt: salt)
    }

    static func createFromPackagedRice(readyToEatPacket: Gram) -> Rice {
        return Rice(readyToEatPacket: readyToEatPacket)
    }
}

let riceFromRawRice = RiceFactory.createFromPackagedRice(readyToEatPacket: 200)
print(riceFromRawRice.rice) // Prints "120"
