import UIKit

class ViewControllerA: UIViewController {}
class ViewControllerB: UIViewController {}
class ViewControllerC: UIViewController {}
class ViewControllerD: UIViewController {}
class ViewControllerE: UIViewController {}

class TabBarController: UITabBarController {}

class TabBarBuilder: CustomStringConvertible {
    private var viewControllers: [UIViewController] = []
    var tabBarController: UITabBarController

    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }

    func addTab(viewController: UIViewController, title: String, image: UIImage) {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        viewControllers.append(viewController)
        tabBarController.viewControllers = viewControllers
    }

    var description: String {
        var text = ""
        for vc in viewControllers {
            text += String(describing: type(of: vc))
            text += "\n"
        }
        return text
    }
}

let viewControllerA = ViewControllerA()
let viewControllerB = ViewControllerB()
let viewControllerC = ViewControllerC()
let viewControllerD = ViewControllerD()

let tabBarController = TabBarController()
let tabBarBuilder = TabBarBuilder(tabBarController: tabBarController)

tabBarBuilder.addTab(viewController: viewControllerA,
                     title: "viewControllerA",
                     image: UIImage(systemName: "pencil")!)
tabBarBuilder.addTab(viewController: viewControllerB,
                     title: "viewControllerB",
                     image: UIImage(systemName: "eraser")!)
tabBarBuilder.addTab(viewController: viewControllerC,
                     title: "viewControllerC",
                     image: UIImage(systemName: "highlighter")!)
tabBarBuilder.addTab(viewController: viewControllerD,
                     title: "viewControllerD",
                     image: UIImage(systemName: "keyboard")!)

print(tabBarBuilder.description)
// Prints
// ViewControllerA
// ViewControllerB
// ViewControllerC
// ViewControllerD
