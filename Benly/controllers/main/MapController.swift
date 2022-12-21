import UIKit
import CoreLocation
import MapboxMaps

class MapController: UIViewController {
    
    @IBOutlet var mapView: MapView!
    var locationManager = LocationManager()
    var map = MapboxMapHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.setupLocationManager()
        map.setupMapboxMapHelper(mapView: mapView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}
