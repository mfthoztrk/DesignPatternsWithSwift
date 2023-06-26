import UIKit

class ViewControllerA: UIViewController {}
class ViewControllerB: UIViewController {}
class ViewControllerC: UIViewController {}
class ViewControllerD: UIViewController {}
class ViewControllerE: UIViewController {}

class TabBarController: UITabBarController {
    func initializeTabs() {
        let viewControllerA = ViewControllerA()
        viewControllerA.tabBarItem.title = "ViewControllerA"
        viewControllerA.tabBarItem.image = UIImage(systemName: "pencil")

        let viewControllerB = ViewControllerB()
        viewControllerB.tabBarItem.title = "ViewControllerB"
        viewControllerB.tabBarItem.image = UIImage(systemName: "eraser")

        let viewControllerC = ViewControllerC()
        viewControllerC.tabBarItem.title = "ViewControllerC"
        viewControllerC.tabBarItem.image = UIImage(systemName: "highlighter")

        let viewControllerD = ViewControllerD()
        viewControllerD.tabBarItem.title = "ViewControllerD"
        viewControllerD.tabBarItem.image = UIImage(systemName: "keyboard")

        viewControllers = [viewControllerA,
                           viewControllerB,
                           viewControllerC,
                           viewControllerD]
    }

    override var description: String {
        var text = ""
        guard let viewControllers else { return text }
        for vc in viewControllers {
            text += String(describing: type(of: vc))
            text += "\n"
        }
        return text
    }
}

let tabBarController = TabBarController()
tabBarController.initializeTabs()
print(tabBarController.description)
// Prints
// ViewControllerA
// ViewControllerB
// ViewControllerC
// ViewControllerD
