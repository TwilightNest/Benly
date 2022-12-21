import Foundation

class UserLocation : Codable {
    var UserId: UUID = UUID(uuidString: "00000000-0000-0000-0000-000000000000")!
    var Latitude: Double?
    var Longitude: Double?
    
    init(){
        self.Latitude = 0
        self.Longitude = 0
    }
    
    init(UserId: UUID, Latitude: Double, Longitude: Double) {
        self.UserId = UserId
        self.Latitude = Latitude
        self.Longitude = Longitude
    }
    
    init(json: [String: Any]) {
        self.UserId = UUID(uuidString: (json["userId"] as? String)!)!
        self.Latitude = (json["latitude"] as? Double)!
        self.Longitude = (json["longitude"] as? Double)!
    }
    
    func getJsonDictionary() -> [String: String] {
        var tmp = [String: String]()
        tmp.updateValue(UserId.uuidString, forKey: "userId")
        tmp.updateValue("\(String(describing: Latitude))", forKey: "latitude")
        tmp.updateValue("\(String(describing: Longitude))", forKey: "longitude")
        return tmp
    }
}
