import UIKit
import CoreLocation
import MapKit

class MapController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupLocationManager()
    }
    
    func setupLocationManager(){
        //настраиваем делегат
        //locationManager.delegate = self;
        
        locationManager.desiredAccuracy  = kCLLocationAccuracyBest
    }
    
    func checkLocationEnabled(){
        if !CLLocationManager.locationServicesEnabled(){
            let alert = UIAlertController(title: "Youre location is off", message: "Turn it on?", preferredStyle: .alert)
            
            let settingsAction = UIAlertAction(title: "Go to settings", style: .default){ (alert) in
                if let url = URL(string: "App-Prefs:root=LOCATION_SERVICES"){
                    UIApplication.shared.open(url)
                }
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            alert.addAction(settingsAction)
            alert.addAction(cancelAction)
        }
    }
    
    func checkAutorization(){
        switch CLLocationManager.authorizationStatus(){
        case .authorizedAlways:
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
            break
        case .authorizedWhenInUse:
            break
        case .denied:
            break
        case .restricted:
            break
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
            break
        default:
            break
        }
    }
}
