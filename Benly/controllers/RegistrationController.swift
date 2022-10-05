import UIKit

class RegistrationController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    
    @IBAction func registerUserButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mapViewController = storyboard.instantiateViewController(withIdentifier: "MapController")
        view.window?.rootViewController = mapViewController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //убираем клавиатуру по клику на view
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
