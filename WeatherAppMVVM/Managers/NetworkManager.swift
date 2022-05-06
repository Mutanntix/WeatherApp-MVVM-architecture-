//
//  NetworkManager.swift
//  WeatherAppMVVM
//
//  Created by Мурад Чеерчиев on 05.05.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let apiKey = "ff95518044843b042231937f088f0308"
    
    private init() {}
    
    func getApiOffer(for city: String,
                     completion: @escaping (ApiOfferModel?) -> Void) {
        guard let url = getUrl(for: city)
        else {
            print("crashed when tried to get url")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession(configuration: .default)
        
        task.dataTask(with: request) { data, _, error in
            if error != nil {
                print(error?.localizedDescription as Any)
                return
            }
            let decoder = JSONDecoder()
            
            if data != nil {
                let decodedApiOfferModel =
                try? decoder.decode(ApiOfferModel.self,
                                    from: data!)
                completion(decodedApiOfferModel)
            } else {
                print("data offer == nil",
                      error?.localizedDescription as Any)
                return
            }
        }.resume()
    }
    
    private func getUrl(for city: String) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.openweathermap.org"
        urlComponents.path = "/data/2.5/weather"
        urlComponents.queryItems = [
            URLQueryItem(name: "q",
                         value: city),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appid",
                         value: "ff95518044843b042231937f088f0308")]
        
        return urlComponents.url
    }
}
