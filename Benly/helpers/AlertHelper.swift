import UIKit

class AlertHelper {

    static func showAlertMessage(parentController: UIViewController, title: String, message: String){
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        parentController.present(alert, animated: true, completion: nil)
    }
    
    static func showAlertDialog(parentController: UIViewController, title: String, message: String){
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
    
        // show the alert
        parentController.present(alert, animated: true, completion: nil)
    }
}
