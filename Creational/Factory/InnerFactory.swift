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

    private init(readyToUsePacket: Gram) {
        rice = readyToUsePacket * 0.6
        oil = readyToUsePacket * 0.1
        water = readyToUsePacket * 0.38
        salt = readyToUsePacket * 0.02
    }

    class RiceFactory {
        static func createFromRawRice(rice: Gram, oil: Gram, water: Gram, salt: Gram) -> Rice {
            return Rice(rice: rice, oil: oil, water: water, salt: salt)
        }

        static func createFromPackagedRice(readyToUsePacket: Gram) -> Rice {
            return Rice(readyToUsePacket: readyToUsePacket)
        }
    }
}

let rice = Rice.RiceFactory.createFromRawRice(rice: 100, oil: 10, water: 200, salt: 5)
print(rice.rice) // Prints "100"
