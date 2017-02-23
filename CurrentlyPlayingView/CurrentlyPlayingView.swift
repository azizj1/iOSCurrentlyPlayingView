import UIKit

@IBDesignable
class CurrentlyPlayingView: UIView {
    
    var view: UIView!
    var isCurrentlyPlayingHidden = false
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var customView: UIView!
    
    func hideCustomView() {
        isCurrentlyPlayingHidden = true
        customView.alpha = 0
        let newY = frame.origin.y
            + CGFloat(TabBarViewController.maxHeight)
            - CGFloat(TabBarViewController.minHeight)
        frame = CGRect(x: 0, y: newY, width: frame.width, height: CGFloat(TabBarViewController.maxHeight))
    }
    func showCustomView() {
        isCurrentlyPlayingHidden = false
        customView.alpha = 1
        let newY = frame.origin.y
            - CGFloat(TabBarViewController.maxHeight)
            + CGFloat(TabBarViewController.minHeight)
        frame = CGRect(x: 0, y: newY, width: frame.width, height: CGFloat(TabBarViewController.maxHeight))
    }
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = tabBar.sizeThatFits(size)
        sizeThatFits.height = CGFloat(isCurrentlyPlayingHidden ? TabBarViewController.minHeight : TabBarViewController.maxHeight)
        return sizeThatFits
    }
    convenience init(copyFrom tabBar: UITabBar) {
        self.init(frame: tabBar.frame)
        self.tabBar.backgroundColor = tabBar.backgroundColor
        self.tabBar.tintColor = tabBar.tintColor
        self.tabBar.unselectedItemTintColor = tabBar.unselectedItemTintColor
        self.tabBar.isTranslucent = tabBar.isTranslucent
        self.tabBar.barStyle = tabBar.barStyle
        self.tabBar.barTintColor = tabBar.barTintColor
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
    }
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "\(type(of: self))", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
}
