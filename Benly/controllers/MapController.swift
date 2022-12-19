import UIKit
import CoreLocation
import MapboxMaps

class MapController: UIViewController, LocationPermissionsDelegate {
    
    @IBOutlet var mapView: MapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.location.delegate = self
        
        mapView.location.options.puckType = .puck2D()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}
