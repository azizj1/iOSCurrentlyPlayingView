import UIKit

class TabBarViewController: UITabBarController {
    
    var currentlyPlaying: CurrentlyPlayingView!
    static let maxHeight = 100
    static let minHeight = 49
    static var tabbarHeight = maxHeight
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentlyPlaying = CurrentlyPlayingView(copyFrom: tabBar)
        currentlyPlaying.tabBar.delegate = self
        
        view.addSubview(currentlyPlaying)
        tabBar.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        currentlyPlaying.tabBar.items = tabBar.items
        currentlyPlaying.tabBar.selectedItem = tabBar.selectedItem
    }
    func hideCurrentlyPlaying() {
        TabBarViewController.tabbarHeight = TabBarViewController.minHeight
        UIView.animate(withDuration: 0.5, animations: {
            self.currentlyPlaying.hideCustomView()
            self.updateSelectedViewControllerLayout()
        })
    }
    func showCurrentlyPlaying() {
        TabBarViewController.tabbarHeight = TabBarViewController.maxHeight
        UIView.animate(withDuration: 0.5, animations: {
            self.currentlyPlaying.showCustomView()
            self.updateSelectedViewControllerLayout()
        })
    }
    func updateSelectedViewControllerLayout() {
        tabBar.sizeToFit()
        tabBar.sizeToFit()
        currentlyPlaying.sizeToFit()
        view.setNeedsLayout()
        view.layoutIfNeeded()
        viewControllers?[self.selectedIndex].view.setNeedsLayout()
        viewControllers?[self.selectedIndex].view.layoutIfNeeded()
    }
}

extension UITabBar {
    
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = CGFloat(TabBarViewController.tabbarHeight)
        return sizeThatFits
    }
}
