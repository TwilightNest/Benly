import UIKit

class AuthController: UIViewController {
    
    let api: ApiProcessor = ApiProcessor()
    
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBAction func unwindToSignUp(segue: UIStoryboardSegue){
        AlertHelper.showAlertMessage(title: "Good", message: "You successfully sign up")
    }
    
    @IBAction func signInButtonClick() {
        if !loginTextField.text!.isEmpty || !passwordTextField.text!.isEmpty{
            let response = api.getUserByData(data: loginTextField.text!)
            switch response.0 {
            case 200...299:
                if passwordTextField.text! == response.1?.Password{
                    do {
                        let data = try JSONEncoder().encode(response.1)
                        UserDefaults.standard.set(data,forKey: "CurrentUser")
                    }
                    catch {
                        print(error)
                        return
                    }
                    
                    view.window?.rootViewController = WorkspaceHelper.switchStoryboard(sbName: "Main", controllerName: "Main")
                } else {
                    AlertHelper.showAlertMessage(title: "Error", message: "Wrong password")
                }
            case 400...499:
                AlertHelper.showAlertMessage(title: "Error", message: "User not found")
            default:
                AlertHelper.showAlertMessage(title: "Error", message: "WTF???")
            }
        } else {
            AlertHelper.showAlertMessage(title: "Error", message: "Fill all fields")
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
