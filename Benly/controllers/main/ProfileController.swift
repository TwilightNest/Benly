import UIKit

class ProfileController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logOutButtonClick() {
        UserDefaults.standard.removeObject(forKey: "CurrentUser")
        view.window?.rootViewController = WorkspaceHelper.switchStoryboard(sbName: "Auth", controllerName: "Auth")
    }
    
}
