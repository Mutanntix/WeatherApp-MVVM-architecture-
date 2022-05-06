//
//  MainViewModel.swift
//  WeatherAppMVVM
//
//  Created by Мурад Чеерчиев on 05.05.2022.
//

import Foundation

protocol MainViewModelProtocol: AnyObject {
    
    func numberOfRows() -> Int
    func fetchWeather(city: String,
                      completion: @escaping () -> Void)
}

class MainViewModel: MainViewModelProtocol {
    
    private var weatherModel: ApiOfferModel?
    private var timer = Timer()
    
    func numberOfRows() -> Int {
        return 1
    }
    
    func fetchWeather(city: String,
                      completion: @escaping () -> Void) {
        if city != "" {
            timer = Timer.scheduledTimer(withTimeInterval: 2,
                                         repeats: false,
                                         block: { _ in
                NetworkManager
                    .shared.getApiOffer(for: city)
                { [weak self] apiOffer in
                    guard let model = apiOffer
                    else { return }
                    self?.weatherModel = model
                    completion()
                }
            })
        }
    }
    
    
}
