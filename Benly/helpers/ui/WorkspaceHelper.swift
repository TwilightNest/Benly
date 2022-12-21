import UIKit

class WorkspaceHelper {
    
    static func switchStoryboard(sbName: String, controllerName: String) -> UIViewController{
        let storyboard = UIStoryboard(name: sbName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: controllerName)
        return viewController
    }

    static func performSegue(parentController: UIViewController, segueIdentifier: String){
        parentController.performSegue(withIdentifier: segueIdentifier, sender: parentController)
    }
}
