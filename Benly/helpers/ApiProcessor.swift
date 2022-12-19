class ApiProcessor {
    let baseUrl: String = "http://185.152.139.127"
    let usersUrl: String = "/Users"
    
    func registerNewUser(newUser: User) -> Int {
        
        let responseCode = HttpRequester.sendSyncPostRequest(urlValue: baseUrl + usersUrl, jsonDictionary: newUser.getJsonDictionary())
        
        return responseCode;
    }
}
