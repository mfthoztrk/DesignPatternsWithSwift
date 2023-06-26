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

    init(readyToUsePacket: Gram) {
        rice = readyToUsePacket * 0.6
        oil = readyToUsePacket * 0.1
        water = readyToUsePacket * 0.38
        salt = readyToUsePacket * 0.02
    }

    static func createFromRawRice(rice: Gram, oil: Gram, water: Gram, salt: Gram) -> Rice {
        return Rice(rice: rice, oil: oil, water: water, salt: salt)
    }

    static func createFromPackagedRice(readyToUsePacket: Gram) -> Rice {
        return Rice(readyToUsePacket: readyToUsePacket)
    }
}

let riceFromRawRice = Rice.createFromRawRice(rice: 200, oil: 40, water: 400, salt: 10)
print(riceFromRawRice.rice) // Prints "200"

let readyToUseRice = Rice.createFromPackagedRice(readyToUsePacket: 100)
print(readyToUseRice.rice) // Prints "60"
