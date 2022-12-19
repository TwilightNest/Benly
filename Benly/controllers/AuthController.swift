import UIKit

class AuthController: UIViewController {

    @IBAction func loginButtonClick() {
        view.window?.rootViewController = StoryboardSwitcher.switchStoryboard(sbName: "Main", controllerName: "Main")
    }
    
    @IBAction func registerButtonClick() {
        view.window?.rootViewController = StoryboardSwitcher.switchStoryboard(sbName: "Register", controllerName: "Register")
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
