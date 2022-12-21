import UIKit

class AlertHelper {

    static func showAlertMessage(title: String, message: String){
        //get top viewController
        let topController = UIApplication.shared.topViewController()
        
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        topController!.present(alert, animated: true, completion: nil)
    }
    
    static func showAlertDialog(title: String, message: String){
        //get top viewController
        let topController = UIApplication.shared.topViewController()
        
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
    
        // show the alert
        topController!.present(alert, animated: true, completion: nil)
    }
}
