//
//  WeatherService.swift
//  Weather
//
//  Created by Yanish Bhujun on 24/09/2022.
//

import Foundation
import CoreLocation


public final class WeatherService: NSObject {
    
    private let locationManager = CLLocationManager()
    private let API_KEY = "cfc72d5e10d0a5e16fc549384f92bfcb"
    private var completionHandler: ((weather) -> Void)?
    
    public func loadWeatherData(_ completionHandler: @escaping((weather) -> Void)) {
        self.completionHandler = completionHandler
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    //https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    private func makeDataRequest(forCoordinates coordinates: CLLocationCoordinate2D) {
        guard let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(API_KEY)&units=metrics"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
                guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) {data, response, error in guard error == nil, let data = data else { return }
            if let response = try? JSONDecoder().decode(APIResponse.self, from: data) {
                self.completionHandler?(Weather(response: response))
            }
        }.resume()
    }
    
}

struct APIResponse {
    let name: String
    let main : APIMain
    let weather: [APIWeather]
}

struct APIMain : Decodable {
    let temp: Double
}

struct APIWeather: Decodable {
    let description: String
    let iconName: String
    
    enum CodingKeys: String, CodingKey {
        case description
        case iconName = "main"
        
        
    }
}
