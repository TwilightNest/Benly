import UIKit

class StoryboardSwitcher {
    
    static func switchStoryboard(sbName: String, controllerName: String) -> UIViewController{
        let storyboard = UIStoryboard(name: sbName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: controllerName)
        return viewController
    }
    
}
