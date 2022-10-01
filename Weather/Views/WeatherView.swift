//
//  ContentView.swift
//  Weather
//
//  Created by Yanish Bhujun on 24/09/2022.
//

import SwiftUI


struct WeatherView: View {
    @StateObject var locationManager = LocationManager()
    
     
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                Text("Vos coordonées géographique sont: \(location.longitude), \(location.latitude)")
                     } else {
                        if locationManager.isLoading {
                            LoadingView()
                        } else {
                            WelcomeView()
                                .environmentObject(locationManager)
                    }
                }
            Text(viewModel.cityName)
                .font(.largeTitle)
                .padding()
            Text(viewModel.temperature)
                .font(.system(size: 70))
                .bold()
            Text(viewModel.weatherIcon)
                .font(.largeTitle)
                .padding()
            Text(viewModel.weatherDescription)
        }.onAppear(perform: viewModel.refresh)
            .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
            .preferredColorScheme(.dark)
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}

