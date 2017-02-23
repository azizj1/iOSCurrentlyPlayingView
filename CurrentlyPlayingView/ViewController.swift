import UIKit

class ViewController: UIViewController {
    
    @IBAction func toggleCurrentlyPlayingVisibility() {
        if let tabBarController = tabBarController as? TabBarViewController {
            if tabBarController.currentlyPlaying.isCurrentlyPlayingHidden {
                tabBarController.showCurrentlyPlaying()
            }
            else {
                tabBarController.hideCurrentlyPlaying()
            }
        }
    }
}

