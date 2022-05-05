//
//  NetworkProtocol.swift
//  WeatherAppMVVM
//
//  Created by Мурад Чеерчиев on 05.05.2022.
//

import Foundation

protocol NetworkProtocol: AnyObject {
    func getApiOffer(for city: String,
                     completion: @escaping (ApiOfferModel?) -> Void)
    
}
