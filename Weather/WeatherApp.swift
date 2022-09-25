//
//  WeatherApp.swift
//  Weather
//
//  Created by Yanish Bhujun on 24/09/2022.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            
            let weatherService = WeatherService()
            let viewModel = WeatherViewModel(weatherService: weatherService)
            WeatherView(viewModel: viewModel)
        }
    }
}

