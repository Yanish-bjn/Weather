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
                            //
                                                   },
                          label: {
                            Image(systemName:"magnifyingglass")
                                  .font(.largeTitle)
                                  .accentColor(.white)
                                  .toolbar{
                                      ToolbarItemGroup(placement: .keyboard) {
                                          Button("Reset"){
                                          }.tint(.red)
                                      }
                                  }
                          })
                        
                        Button(
                          action: {
                            // 1
                            NotificationManager.shared.requestAuthorization { granted in
                                
                                let userNotificationCenter = UNUserNotificationCenter.current()
                                
                                let tempmin = (weather.main.tempMin.roundDouble() as NSString).integerValue
                                let tempmax = (weather.main.tempMax.roundDouble() as NSString).integerValue
                                
                                let notificationContent = UNMutableNotificationContent()
                                notificationContent.title = "Bilan de la journée"
                                if (tempmin <= 5) {
                                    notificationContent.body = "Attention aujourd'hui les températures seront inférieurs à 5° avec \(weather.main.temp_min.roundDouble() + "° en matinée") couvrez vous bien !"
                                }
                                else if (tempmax >= 28){
                                    notificationContent.body = "Canicule, attention aujourd'hui les températures seront très chaudes avec \(weather.main.temp_max.roundDouble() + "°") hydratez vous bien !"
                                }
                                else {
                                    notificationContent.body = "Aujourd'hui, pas de risque particulier, il fera un minimum de \(weather.main.temp_min.roundDouble() + "°") avec un pique de température à \(weather.main.temp_max.roundDouble() + "°")"
                                }
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
                                
                                let wind_speed = (weather.wind.speed.roundDouble() as NSString).integerValue
                                
                                let notificationContent2 = UNMutableNotificationContent()
                                notificationContent2.title = "Climat critique"
                                
                                if (wind_speed >= 10 && wind_speed < 20) {
                                    notificationContent2.body = "Attention aujourd'hui fort risque de vent pouvant être violant, avec des brises allant jusqu'a \(weather.wind.speed.roundDouble() + "m/s")"
                                }
                                else if (wind_speed >= 20 && wind_speed < 40){
                                    notificationContent2.body = "Attention aujourd'hui risque de tempête, restez chez vous de préference le soufle sera de \(weather.wind.speed.roundDouble() + "m/s")"
                                }
                                else {
                                    notificationContent2.body = "Aujourd'hui très peu de vent à signaler, la brise sera de \(weather.wind.speed.roundDouble() + "m/s"), cependant restez prudent et couvrez vous bien."
                                }
                                
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
                                
                                userNotificationCenter2.add(request2) { (error) in
                                    if let error = error {
                                        print("Notification Error: ", error)
                                    }
                                }
                                
                                let userNotificationCenter3 = UNUserNotificationCenter.current()

                                let humidity = (weather.main.humidity.roundDouble() as NSString).integerValue

                                let notificationContent3 = UNMutableNotificationContent()
                                notificationContent3.title = "Information pluie"
                                
                                if (humidity <= 100 && humidity >= 70){
                                    notificationContent3.body = "Attention aujourd'hui à \(weather.name) le taux d'humidité sera très élever avec \(weather.main.humidity.roundDouble() + "% d'humidité"), il y a aura donc de forte pluie de prévue, n'oubliez pas votre parapluie"
                                }
                                else if (humidity < 70 && humidity >= 40){
                                    notificationContent3.body = "Attention aujourd'hui à \(weather.name) le taux d'humidité sera moyennement haut avec \(weather.main.humidity.roundDouble() + "% d'humidité"), attention des petites pluies sont prévue."
                                }
                                else {
                                    notificationContent3.body = "Aujourd'hui à \(weather.name) aucun milimètre d'eau n'est attendu, le taux d'humidité sera faible avec \(weather.main.humidity.roundDouble() + "% d'humidité")"
                                }
                                
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
                                notificationContent4.body = "Aujourd'hui, le soliel ce lévera à \(String(describing: strDate + "h")) et en fin de journée le soleil ce couchera à \(String(describing: strDate2 + "h"))"
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
                            NotificationCenterView(weather: weather)

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


