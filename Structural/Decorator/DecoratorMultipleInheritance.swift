protocol CanFly {
    func fly()
}

class Bat: CanFly {
    func fly() {}
}

protocol CanRun {
    func run()
}

class Man: CanRun {
    func run() {}
}

// Decorator
class BatMan: CanFly, CanRun {
    private let bat = Bat()
    private let man = Man()
    
    func fly() {
        bat.fly()
    }
    
    func run() {
        man.run()
    }
}
