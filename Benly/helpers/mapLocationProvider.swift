import UIKit
import MapboxMaps

class mapLocationProvider: LocationProviderDelegate {
    
    func locationProvider(_ provider: MapboxMaps.LocationProvider, didUpdateLocations locations: [CLLocation]) {
        print("Updated!")
    }
    
    func locationProvider(_ provider: MapboxMaps.LocationProvider, didUpdateHeading newHeading: CLHeading) {
        
    }
    
    func locationProvider(_ provider: MapboxMaps.LocationProvider, didFailWithError error: Error) {
        
    }
    
    func locationProviderDidChangeAuthorization(_ provider: MapboxMaps.LocationProvider) {
        
    }
    
}
