//
//  WeatherOfferModel.swift
//  WeatherAppMVVM
//
//  Created by Мурад Чеерчиев on 05.05.2022.
//

import Foundation

struct ApiOfferModel: Codable {
    let weather: [WeatherModel]
    let main: WeatherDescriptionModel
    let visibility: Float
    let wind: WindModel
    let clouds: CloudModel
}
