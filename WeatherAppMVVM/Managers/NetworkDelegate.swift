//
//  NetworkDelegate.swift
//  WeatherAppMVVM
//
//  Created by Мурад Чеерчиев on 05.05.2022.
//

import Foundation

class NetworkDelegate: NetworkProtocol {
    func getApiOffer(for city: String, completion: @escaping (ApiOfferModel?) -> Void) {
        NetworkManager.shared.getApiOffer(for: city,
                                          completion: completion)
    }
    
    
}
