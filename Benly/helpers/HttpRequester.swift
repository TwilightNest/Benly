import Foundation

class HttpRequester {
    
    static func sendSyncPostRequest(urlValue: String, jsonDictionary: [String: String]) -> Int {

        let url = URL(string: urlValue)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]

        let dataToPost = try! JSONSerialization.data(withJSONObject: jsonDictionary, options: .prettyPrinted)
        
        var responseCode = 0;
        let lock = NSLock()
        
        let task = URLSession.shared.uploadTask(with: request, from: dataToPost) { (responseData, response, error) in
            
            responseCode = (response as? HTTPURLResponse)!.statusCode
            lock.unlock()
//            if let responseJSONData = try? JSONSerialization.jsonObject(with: responseData, options: .allowFragments) {
//                    print("Response JSON data = \(responseJSONData)")
//            }
        }
        
        task.resume()
        lock.lock()
        
        return responseCode
    }
    
}
