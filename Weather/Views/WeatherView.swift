//
//  WeatherView.swift
//  Weather
//
//  Created by Yanish Bhujun on 01/10/2022.
//

import SwiftUI

struct WeatherView: View {
    @State var showNotificationSettingsUI = false


    var weather: ResponseBody
        
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    
                    HStack {
                        Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                            .fontWeight(.light)
                        Spacer()
                        
                        Button(
                          action: {
                            // 1
                            NotificationManager.shared.requestAuthorization { granted in
                                
                                let userNotificationCenter = UNUserNotificationCenter.current()

                                let notificationContent = UNMutableNotificationContent()
                                notificationContent.title = "Bilan de la journée"
                            notificationContent.body = "Aujourd'hui, il fera un minimum de \(weather.main.tempMin.roundDouble() + "°") avec un pique de tempeérature à \(weather.main.tempMax.roundDouble() + "°")"
                                notificationContent.badge = NSNumber(value: 3)
                                
                                if let url = Bundle.main.url(forResource: "dune",
                                                             withExtension: "png") {
                                    if let attachment = try? UNNotificationAttachment(identifier: "dune",
                                                                                      url: url,
                                                                                      options: nil) {
                                        notificationContent.attachments = [attachment]
                                    }
                                }
                                
                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 18000,
                                                                                repeats: true)
                                let request = UNNotificationRequest(identifier: "Bilan de la journée",
                                                                    content: notificationContent,
                                                                    trigger: trigger)
                                
                                userNotificationCenter.add(request) { (error) in
                                    if let error = error {
                                        print("Notification Error: ", error)
                                    }
                                }
                                
                                
                                let userNotificationCenter2 = UNUserNotificationCenter.current()
                                
                                let notificationContent2 = UNMutableNotificationContent()
                                notificationContent2.title = "Climat critique"
                                notificationContent2.body = "Attention aujourd'hui fort risque de vent avec des vents allant jusqu'a \(String(describing: weather.wind.speed.roundDouble() + "m/s")) on notera également un taux d'humidité éléver de \(String(describing: weather.main.humidity.roundDouble() + "%"))"
                                notificationContent2.badge = NSNumber(value: 3)
                                
                                if let url2 = Bundle.main.url(forResource: "dune",
                                                             withExtension: "png") {
                                    if let attachment2 = try? UNNotificationAttachment(identifier: "dune",
                                                                                      url: url2,
                                                                                      options: nil) {
                                        notificationContent2.attachments = [attachment2]
                                    }
                                }
                                
                                let trigger2 = UNTimeIntervalNotificationTrigger(timeInterval: 18000,
                                                                                repeats: true)
                                let request2 = UNNotificationRequest(identifier: "Climat critique de la journée",
                                                                    content: notificationContent2,
                                                                    trigger: trigger2)
                                
                                userNotificationCenter.add(request2) { (error) in
                                    if let error = error {
                                        print("Notification Error: ", error)
                                    }
                                }
                                
                                let userNotificationCenter3 = UNUserNotificationCenter.current()

                                let notificationContent3 = UNMutableNotificationContent()
                                notificationContent3.title = "Information pluie"
                                notificationContent3.body = "Attention aujourd'hui à \(String(describing: weather.name)) aucun milimètre d'eau n'est attendu, cependant la pression de l'air reste elever avec \(String(describing: weather.main.pressure.roundDouble() + " N/m²")) ce qui peut risqué l'apparition d'averse"
                                notificationContent3.badge = NSNumber(value: 3)
                                
                                if let url3 = Bundle.main.url(forResource: "dune",
                                                             withExtension: "png") {
                                    if let attachment3 = try? UNNotificationAttachment(identifier: "dune",
                                                                                      url: url3,
                                                                                      options: nil) {
                                        notificationContent3.attachments = [attachment3]
                                    }
                                }
                                
                                let trigger3 = UNTimeIntervalNotificationTrigger(timeInterval: 18000,
                                                                                repeats: true)
                                let request3 = UNNotificationRequest(identifier: "Information pluie de la journée",
                                                                    content: notificationContent3,
                                                                    trigger: trigger3)
                                
                                userNotificationCenter3.add(request3) { (error) in
                                    if let error = error {
                                        print("Notification Error: ", error)
                                    }
                                }
                                
                                
                                let date = Date(timeIntervalSince1970: weather.sys.sunrise)
                                let dateFormatter = DateFormatter()
                                dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
                                dateFormatter.locale = NSLocale.current
                                dateFormatter.dateFormat = "HH:mm"
                                let strDate = dateFormatter.string(from: date)
                                
                                let date2 = Date(timeIntervalSince1970: weather.sys.sunset)
                                let dateFormatter2 = DateFormatter()
                                dateFormatter2.timeZone = TimeZone(abbreviation: "GMT")
                                dateFormatter2.locale = NSLocale.current
                                dateFormatter2.dateFormat = "HH:mm"
                                let strDate2 = dateFormatter2.string(from: date2)
                                
                                let userNotificationCenter4 = UNUserNotificationCenter.current()

                                let notificationContent4 = UNMutableNotificationContent()
                                notificationContent4.title = "Information ensoleillement"
                                notificationContent4.body = "Aujourd'hui, le soliel ce lévera à \(String(describing: strDate + "h")), en fin de journée le soleil ce couchera à \(String(describing: strDate2 + "h"))"
                                notificationContent4.badge = NSNumber(value: 3)
                                
                                if let url4 = Bundle.main.url(forResource: "dune",
                                                             withExtension: "png") {
                                    if let attachment4 = try? UNNotificationAttachment(identifier: "dune",
                                                                                      url: url4,
                                                                                      options: nil) {
                                        notificationContent4.attachments = [attachment4]
                                    }
                                }
                                
                                let trigger4 = UNTimeIntervalNotificationTrigger(timeInterval: 18000,
                                                                                repeats: true)
                                let request4 = UNNotificationRequest(identifier: "Information ensoleillement de la journée",
                                                                    content: notificationContent4,
                                                                    trigger: trigger4)
                                
                                userNotificationCenter4.add(request4) { (error) in
                                    if let error = error {
                                        print("Notification Error: ", error)
                                    }
                                }
                                
                              // 2
                              if granted {
                                showNotificationSettingsUI = true
                              }
                            }
                          },
                          label: {
                            Image(systemName: "bell")
                                  .font(.largeTitle)
                                  .accentColor(.white)
                          })
                        .padding(.trailing)
                        .sheet(isPresented: $showNotificationSettingsUI) {
                            NotificationCenterView(weather: previewWeather)
                        }
                    }
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing:20){
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) {
                        image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather now")
                        .bold().padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo: "thermometer.snowflake", name: "Min temp", value:(weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo:"thermometer.sun.fill", name: "Max temp ", value:(weather.main.tempMax.roundDouble() + "°"))
                        
                    }
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind speed", value:(weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value:(weather.main.humidity.roundDouble() + "%"))

                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}


