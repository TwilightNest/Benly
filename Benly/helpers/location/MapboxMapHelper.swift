import UIKit
import MapboxMaps

class MapboxMapHelper: LocationPermissionsDelegate {

    var mapView : MapView!
    
    func setupMapboxMapHelper(mapView: MapView){
        self.mapView = mapView
        mapView.location.delegate = self
        mapView.location.options.puckType = .puck2D()
    }
    
    func addPointToMap(latitude: Double, longitude: Double) {
        // Define a geographic coordinate.
        let circleCoordinate = CLLocationCoordinate2DMake(latitude, longitude)
        // Create the circle annotation.
        var circleAnnotation = CircleAnnotation(centerCoordinate: circleCoordinate)
        circleAnnotation.circleColor = StyleColor(.blue)
        // Create the `CircleAnnotationManager` which will be responsible for handling this annotation
        let circleAnnnotationManager = mapView.annotations.makeCircleAnnotationManager()
        // Add the annotation to the manager.
        circleAnnnotationManager.annotations = [circleAnnotation]
    }
    
    func moveCamera(newLocation: MapboxMaps.Location) {
        mapView.camera.fly(to: CameraOptions(center: newLocation.coordinate))
    }
}
