//
//  Weather.swift
//  Weather
//
//  Created by Yanish Bhujun on 24/09/2022.
//

import Foundation

public struct weather {
    let city: String
    let temperature: String
    let description: String
    let iconName : String
    
    
    init(response: APIResponse) {
        city = response.name
        temperature = "\(Int(response.main.temp))"
        description = response.weather.first?.description ?? ""
        iconName = response.weather.first?.iconName ?? ""
    }
}
