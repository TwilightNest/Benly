import Foundation

class User : Codable {
    var Id: UUID = UUID(uuidString: "00000000-0000-0000-0000-000000000000")!
    var Login: String
    var Email: String
    var PhoneNumber: String
    var Password: String
    
    init(){
        self.Login = ""
        self.Email = ""
        self.PhoneNumber = ""
        self.Password = ""
    }
    
    init(Login: String, Email: String, PhoneNumber: String, Password: String) {
        self.Login = Login
        self.Email = Email
        self.PhoneNumber = PhoneNumber
        self.Password = Password
    }
    
    init(Id: UUID, Login: String, Email: String, PhoneNumber: String, Password: String) {
        self.Id = Id
        self.Login = Login
        self.Email = Email
        self.PhoneNumber = PhoneNumber
        self.Password = Password
    }
    
    init(json: [String: Any]) {
        self.Id = UUID(uuidString: (json["id"] as? String)!)!
        self.Login = (json["login"] as? String)!
        self.Email = (json["email"] as? String)!
        self.PhoneNumber = (json["phoneNumber"] as? String)!
        self.Password = (json["password"] as? String)!
    }
    
    func getJsonDictionary() -> [String: String] {
        var tmp = [String: String]()
        tmp.updateValue(Id.uuidString, forKey: "Id")
        tmp.updateValue(Login, forKey: "Login")
        tmp.updateValue(Email, forKey: "Email")
        tmp.updateValue(PhoneNumber, forKey: "PhoneNumber")
        tmp.updateValue(Password, forKey: "Password")
        return tmp
    }
    
}
