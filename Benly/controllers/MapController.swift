import UIKit
import CoreLocation
import MapboxMaps

class MapController: UIViewController, LocationPermissionsDelegate {
    
    @IBOutlet var mapView: MapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.location.delegate = self
        
        //let initCameraOptions = CameraOptions(center: CLLocationCoordinate2D(latitude: 53.8946, longitude: 27.5606))
        
        //let mapInitIptions = MapInitOptions(cameraOptions: initCameraOptions)
        //mapView = MapView(frame: view.bounds, mapInitOptions: mapInitIptions)
        
        mapView.location.options.puckType = .puck2D()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}
