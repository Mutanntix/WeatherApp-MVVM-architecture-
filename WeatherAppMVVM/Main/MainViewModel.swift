//
//  MainViewModel.swift
//  WeatherAppMVVM
//
//  Created by Мурад Чеерчиев on 05.05.2022.
//

import Foundation

protocol MainViewModelProtocol: AnyObject {
    var currentTemp: String { get }
    var minTemp: String { get }
    var maxTemp: String { get }
    var tempFeelsLike: String { get }
    var windSpeed: String { get }
    var description: String { get }
    var humidity: String { get }
    var pressure: String { get }
    var imageName: String { get }
    
    func fetchWeather(city: String?, completion: @escaping (String?) -> Void)
    
    init?(weatherModel: ApiOfferModel?)
}

class MainViewModel: MainViewModelProtocol {
    
    var currentTemp: String {
        guard let weatherModel = weatherModel else { return "" }
        return "\(weatherModel.main.temp) градусов С."
    }
    
    var minTemp: String {
        guard let weatherModel = weatherModel else { return "" }
        return "\(weatherModel.main.tempMin) градусов С."
    }
    
    var maxTemp: String {
        guard let weatherModel = weatherModel else { return "" }
        return "\(weatherModel.main.tempMax) градусов С."
    }
    
    var tempFeelsLike: String {
        guard let weatherModel = weatherModel else { return "" }
        return "\(weatherModel.main.feelsLike) градусов С."
    }
    
    var windSpeed: String {
        guard let weatherModel = weatherModel else { return "" }
        return "Скорость верта - \(weatherModel.wind.speed) метров в секунду."
    }
    
    var description: String {
        guard let weatherModel = weatherModel else { return "" }
        return "На данный момент - \(weatherModel.weather.first!.description)."
    }
    
    var humidity: String {
        guard let weatherModel = weatherModel else { return "" }
        return "Влажность - \(weatherModel.main.humidity) %."
    }
    
    var pressure: String {
        guard let weatherModel = weatherModel else { return "" }
        return "Давление - \(weatherModel.main.pressure) мм. рт. столба"
    }
    
    var imageName: String {
        guard let weatherModel = weatherModel else { return "" }
        return weatherModel.weather.first!.main
    }
    
    private var weatherModel: ApiOfferModel?
    private var timer = Timer()
    
    required init?(weatherModel: ApiOfferModel?) {
        self.weatherModel = weatherModel
    }
    
    func fetchWeather(city: String?,
                      completion: @escaping (String?) -> Void) {
        if city != nil && city != "" {
            timer.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 1,
                                         repeats: false,
                                         block: { _ in
                NetworkManager
                    .shared.getApiOffer(for: city!)
                { [weak self] apiOffer in
                    guard let model = apiOffer
                    else { return }
                    self?.weatherModel = model
                    DispatchQueue.main.async {
                        completion(city)
                    }
                }
            })
        }
    }
    
    
}
