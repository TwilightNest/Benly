import Foundation

class User : Codable{
    var Id: UUID
    var Login: String
    var Email: String
    var PhoneNumber: String
    var Password: String
    
    init(Id: UUID, Login: String, Email: String, PhoneNumber: String, Password: String) {
        self.Id = Id
        self.Login = Login
        self.Email = Email
        self.PhoneNumber = PhoneNumber
        self.Password = Password
    }
    
    func getJsonDictionary() -> [String: String] {
        var tmp = [String: String]()
        tmp.updateValue(Id.uuidString, forKey: "Id")
        tmp.updateValue(Login, forKey: "Login")
        tmp.updateValue(Email, forKey: "Email")
        tmp.updateValue(PhoneNumber, forKey: "PhoeNumber")
        tmp.updateValue(Password, forKey: "Password")
        return tmp
    }
}
