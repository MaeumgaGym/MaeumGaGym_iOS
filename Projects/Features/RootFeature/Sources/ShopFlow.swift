import UIKit
import RxFlow
import RxSwift
import RxCocoa

class ShopFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }

    private let rootViewController = UINavigationController()

    init() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .white
        viewController.tabBarItem = UITabBarItem(title: "Shop", image: UIImage(systemName: "person.circle"), selectedImage: nil)
        rootViewController.setViewControllers([viewController], animated: false)
    }

    func navigate(to step: Step) -> FlowContributors {
        return .none
    }
}