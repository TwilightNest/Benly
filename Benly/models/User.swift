import Foundation
import Turf

class User: Codable{
    var Id: UUID
    var NickName: String
    var Email: String
    var PhoeNumber: String
    var Settings: JSONObject
    var Photo: [UInt8]
    
    init(Id: UUID, NickName: String, Email: String, PhoeNumber: String, Settings: JSONObject, Photo: [UInt8]) {
        self.Id = Id
        self.NickName = NickName
        self.Email = Email
        self.PhoeNumber = PhoeNumber
        self.Settings = Settings
        self.Photo = Photo
    }
}
