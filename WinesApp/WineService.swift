//
//  WineService.swift
//  WinesApp
//
//  Created by Telegey Nurbekova on 09/04/24.
//

import Foundation

//https://api.sampleapis.com/ - base urs

//wines/reds - endpoints


class WineService {
    static let shared = WineService()
    
    func getWines(completionHandler: @escaping ([Wine]) -> Void) {
        //URLSession - class for working with network requests
        let url = URL(string: "https://api.sampleapis.com/wines/reds")
        
        let urlSession = URLSession.shared
        
        //URLRequest - class for setting up the request
        var urlRequest = URLRequest(url: url!)
        
        //httpMethod - request type (get, post, put, patch, delete)
        urlRequest.httpMethod = "GET"
        
        let task = urlSession.dataTask(with: urlRequest) { data, response, error in
//            guard let error = error, let data = data else {
//                return
//            }
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
            }
            do {
                let wines = try JSONDecoder().decode([Wine].self, from: data!)
                DispatchQueue.main.async {
                    completionHandler(wines)
                }
            } catch {
                print(error.localizedDescription)
  
            }
        }
        task.resume()
    }
}
