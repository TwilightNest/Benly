class ApiProcessor {
    let baseUrl: String = "http://185.152.139.127"
    let usersUrl: String = "/Users"
    let usersLocationsUrl: String = "/UsersLocations"
    
    func registerNewUser(newUser: User) -> Int {
        
        let responseCode = HttpRequester.sendSyncAddUserRequest(urlValue: baseUrl + usersUrl, jsonDictionary: newUser.getJsonDictionary())
        
        return responseCode;
    }
    
    func getUserByData(data: String) -> (Int, User?) {
        let response = HttpRequester.sendSyncGetUserByDataRequest(urlValue: baseUrl + usersUrl, dataParametr: data)
        switch response.0 {
        case 200...299:
            return (response.0, User(json: response.1))
        case 400...499:
            return (response.0, nil)
        default:
            return (0,User())
        }
    }
    
    func updateUserLocation(newUserLocation: UserLocation) -> Int {
        let responseCode = HttpRequester.sendSyncUpdateUserLocationRequest(urlValue: baseUrl + usersLocationsUrl, newUserLocation: newUserLocation)
        return responseCode
    }
}
