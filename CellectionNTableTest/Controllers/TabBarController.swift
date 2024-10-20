
import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViewControllers()
    }
    
    private func setUpViewControllers() {
        tabBar.backgroundColor = .light
        let tableViewController = TableViewController()
        let collectionViewController = CollectionViewController()
        
        tableViewController.tabBarItem = UITabBarItem(
            title: "Table",
            image: UIImage(systemName: "text.page"),
            selectedImage: UIImage(systemName: "text.page")
        )
        
        collectionViewController.tabBarItem = UITabBarItem(
            title: "Collection",
            image: UIImage(systemName: "square.grid.3x3.middleright.fill"),
            selectedImage: UIImage(systemName: "square.grid.3x3.middleright.fill")
        )
        
        viewControllers = [tableViewController, collectionViewController]
    }
}

