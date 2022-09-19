import Foundation
import UIKit

class AlertHelper {
    
    static func showLocationOffMessage(parentController: UIViewController){
        let alert = UIAlertController(title: "Your location is off", message: Bundle.main.object(forInfoDictionaryKey: "Location Is Off Description") as? String, preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Go to settings", style: .default){ (alert) in
            if let url = URL(string: "App-Prefs:root=LOCATION_SERVICES"){
                UIApplication.shared.open(url)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        parentController.present(alert, animated: true)
    }
    
    static func showLocationWhileUsingAppMessage(parentController: UIViewController){
        let alert = UIAlertController(title: "Your location set to \"While Using App\"", message: Bundle.main.object(forInfoDictionaryKey: "Location Is While Using App Description") as? String, preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Go to settings", style: .default){ (alert) in
            if let url = URL(string: "App-Prefs:root=Benly"){
                UIApplication.shared.open(url)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        parentController.present(alert, animated: true)
    }
    
    static func showLocationDeniedMessage(parentController: UIViewController){
        let alert = UIAlertController(title: "Your location set to \"Newer\"", message: Bundle.main.object(forInfoDictionaryKey: "Location Is Newer Description") as? String, preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Go to settings", style: .default){ (alert) in
            if let url = URL(string: "App-Prefs:root=Benly"){
                UIApplication.shared.open(url)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        parentController.present(alert, animated: true)
    }
}
