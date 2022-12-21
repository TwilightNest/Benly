import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {

    var locationManager: CLLocationManager!
    var api = ApiProcessor()
    var currentUser = User()
    
    func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 50 // 50.0 meters
        locationManager.startUpdatingLocation()
        
        do {
            let data = UserDefaults.standard.data(forKey:"CurrentUser")
            currentUser = try JSONDecoder().decode(User.self,from:data!)
        }
        catch { print(error) }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.last!)
        let latitudeText:String = "\(locations.last!.coordinate.latitude)"
        let longitudeText:String = "\(locations.last!.coordinate.longitude)"
        
        let newUserLocation = UserLocation(UserId: currentUser.Id, Latitude: locations.last!.coordinate.latitude, Longitude: locations.last!.coordinate.longitude)
        
        let responseCode = api.updateUserLocation(newUserLocation: newUserLocation)
        
        AlertHelper.showAlertDialog(title: "Location update event\n responseCode = \(responseCode)", message:  "Latitude: " + latitudeText + " Longitude: " + longitudeText)
    }
}
