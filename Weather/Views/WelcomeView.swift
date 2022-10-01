//
//  WelcomeView.swift
//  Weather
//
//  Created by Yanish Bhujun on 01/10/2022.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Bienvenue sur notre application de prévision méterologique")
                    .bold().font(.title)
                
                Text("S'il vous plait, pouvez-vous partger votre localisation")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
