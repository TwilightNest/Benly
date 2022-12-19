import UIKit

class RegisterController: UIViewController {
    
    let api: ApiProcessor = ApiProcessor()
    var newUser = User(Id: UUID(uuidString: "00000000-0000-0000-0000-000000000000")!, Login: "",Email: "",PhoneNumber: "",Password: "");
    @IBOutlet var mainView: UIView!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var repeatPasswordTextField: UITextField!
    
    @IBAction func registerButtonClick() {
        if passwordTextField.text! == repeatPasswordTextField.text! {
//            newUser.Login = loginTextField.text!
//            newUser.Email = emailTextField.text!
//            newUser.PhoneNumber = phoneNumberTextField.text!
//            newUser.Password = passwordTextField.text!
            if ((200...299) ~= api.registerNewUser(newUser: newUser)){
                view.window?.rootViewController = StoryboardSwitcher.switchStoryboard(sbName: "Main", controllerName: "Main")
            } else {
                print("Erorr in creating new user")
            }
        } else {
            print("Passwords doesn't match")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        //убираем клавиатуру по клику на view
//        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
//        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
