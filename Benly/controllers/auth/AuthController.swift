import UIKit

class AuthController: UIViewController {
    
    let api: ApiProcessor = ApiProcessor()
    
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBAction func unwindToSignUp(segue: UIStoryboardSegue){
        AlertHelper.showAlertMessage(parentController: self, title: "Good", message: "You successfully sign up")
    }
    
    @IBAction func signInButtonClick() {
        if !loginTextField.text!.isEmpty || !passwordTextField.text!.isEmpty{
            let responce = api.getUserByData(data: loginTextField.text!)
            switch responce.0 {
            case 200...299:
                if passwordTextField.text! == responce.1?.Password{
                    view.window?.rootViewController = WorkspaceHelper.switchStoryboard(sbName: "Main", controllerName: "Main")
                } else {
                    AlertHelper.showAlertMessage(parentController: self, title: "Error", message: "Wrong password")
                }
            case 400...499:
                AlertHelper.showAlertMessage(parentController: self, title: "Error", message: "User not found")
            default:
                AlertHelper.showAlertMessage(parentController: self, title: "Error", message: "WTF???")
            }
        } else {
            AlertHelper.showAlertMessage(parentController: self, title: "Error", message: "Fill all fields")
        }
        
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
