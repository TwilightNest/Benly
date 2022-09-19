import UIKit
import CoreLocation
import MapKit

class MapController: UIViewController , MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //настраиваем делегат
        mapView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupLocationManager()
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        var region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 750, longitudinalMeters: 750)
        mapView.setRegion(region, animated: true)
    }
    
    private func setupLocationManager(){
        locationManager.desiredAccuracy  = kCLLocationAccuracyBest
        
        //проверяем доступ к геолокации
        if !CLLocationManager.locationServicesEnabled(){
            AlertHelper.showLocationOffMessage(parentController: self)
        }
        
        switch CLLocationManager.authorizationStatus(){
        case .authorizedAlways:
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
            break
        case .authorizedWhenInUse:
            AlertHelper.showLocationWhileUsingAppMessage(parentController: self)
            locationManager.startUpdatingLocation()
            break
        case .denied:
            AlertHelper.showLocationDeniedMessage(parentController: self)
            break
        case .restricted:
            break
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
            if !CLLocationManager.locationServicesEnabled(){
                locationManager.startUpdatingLocation()
            } else {
                AlertHelper.showLocationDeniedMessage(parentController: self)
            }
            break
        default:
            break
        }
    }
}
