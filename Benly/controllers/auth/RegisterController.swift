import UIKit

class RegisterController: UIViewController {
    
    let api: ApiProcessor = ApiProcessor()
    
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var repeatPasswordTextField: UITextField!

    @IBAction func signUpButtonClick() {
        if passwordTextField.text! == repeatPasswordTextField.text! {
            let newUser = User(Login: "",Email: "",PhoneNumber: "",Password: "")
            newUser.Login = loginTextField.text!
            newUser.Email = emailTextField.text!
            newUser.PhoneNumber = phoneNumberTextField.text!
            newUser.Password = passwordTextField.text!
            let responseCode = api.registerNewUser(newUser: newUser)
            if ((200...299) ~= responseCode){
                WorkspaceHelper.performSegue(parentController: self, segueIdentifier: "unwindToSignUpSegue")
            } else {
                AlertHelper.showAlertMessage(title: "Error", message: "Response code = \(responseCode)")
            }
        } else {
            AlertHelper.showAlertMessage(title: "Validation error", message: "Passwords doesn't match")
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
