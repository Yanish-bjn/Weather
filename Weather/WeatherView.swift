//
//  ContentView.swift
//  Weather
//
//  Created by Yanish Bhujun on 24/09/2022.
//

import SwiftUI


struct WeatherView: View {
    var body: some View {
        VStack {
            Text("Paris")
                .font(.largeTitle)
                .padding()
        Text("25°C")
                .font(.system(size: 70))
                .bold()
        Text("☁️")
                .font(.largeTitle)
                .padding()
        Text("Ciel clear")
        }
    }
}

    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            WeatherView()
        }
    }

