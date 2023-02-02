//
//  NotificationSettingsView.swift
//  Weather
//
//  Created by Athisayah Nalliah on 26/10/2022.
//

import SwiftUI
import NotificationCenter
import UserNotifications

struct NotificationCenterView: View {
  @ObservedObject var notificationManager = NotificationManager.shared

    var weather: ResponseBody

    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .center, spacing: 30){
                    Spacer()
                    Text("Notification center")
                        .bold().font(.title)
                    
                    HStack {
                        Text("Bilan de la journée")
                            .fontWeight(.light)
                        Spacer()
                        
                        Button(
                          action: {
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
                              
                              let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 7,
                                                                              repeats: false)
                              let request = UNNotificationRequest(identifier: "Bilan de la journée",
                                                                  content: notificationContent,
                                                                  trigger: trigger)
                              
                              userNotificationCenter.add(request) { (error) in
                                  if let error = error {
                                      print("Notification Error: ", error)
                                  }
                              }                          },
                          label: {
                            Image(systemName: "info.circle")
                                  .font(.title2)
                                  .accentColor(.white)
                          })
                        .padding(.trailing)
                    }
                    
                    HStack {
                        Text("Climat critique")
                            .fontWeight(.light)
                        Spacer()
                        
                        Button(
                          action: {
                              
                              let userNotificationCenter = UNUserNotificationCenter.current()
                              
                              let wind_speed = (weather.wind.speed.roundDouble() as NSString).integerValue
                              
                              let notificationContent = UNMutableNotificationContent()
                              notificationContent.title = "Climat critique"
                              
                              if (wind_speed >= 10 && wind_speed < 20) {
                                  notificationContent.body = "Attention aujourd'hui fort risque de vent pouvant être violant, avec des brises allant jusqu'a \(weather.wind.speed.roundDouble() + "m/s")"
                              }
                              else if (wind_speed >= 20 && wind_speed < 40){
                                  notificationContent.body = "Attention aujourd'hui risque de tempête, restez chez vous de préference le soufle sera de \(weather.wind.speed.roundDouble() + "m/s")"
                              }
                              else {
                                  notificationContent.body = "Aujourd'hui très peu de vent à signaler, la brise sera de \(weather.wind.speed.roundDouble() + "m/s"), cependant restez prudent et couvrez vous bien."
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
                              
                              let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 7,
                                                                              repeats: false)
                              let request = UNNotificationRequest(identifier: "Climat critique de la journée",
                                                                  content: notificationContent,
                                                                  trigger: trigger)
                              
                              userNotificationCenter.add(request) { (error) in
                                  if let error = error {
                                      print("Notification Error: ", error)
                                  }
                              }                          },
                          label: {
                            Image(systemName:"cloud.bolt.rain.fill")
                                  .font(.title2)
                                  .accentColor(.white)
                          })
                        .padding(.trailing)
                    }
                    
                    HStack {
                        Text("Risque de pluie")
                            .fontWeight(.light)
                        Spacer()
                        
                        Button(
                          action: {
                              let userNotificationCenter = UNUserNotificationCenter.current()

                              let humidity = (weather.main.humidity.roundDouble() as NSString).integerValue

                              let notificationContent = UNMutableNotificationContent()
                              notificationContent.title = "Information pluie"
                              
                              if (humidity <= 100 && humidity >= 70) {
                                  notificationContent.body = "Attention aujourd'hui à \(weather.name) le taux d'humidité sera très élever avec \(weather.main.humidity.roundDouble() + "% d'humidité"), il y a aura donc de forte pluie de prévue, n'oubliez pas votre parapluie"
                              }
                              else if (humidity < 70 && humidity >= 40){
                                  notificationContent.body = "Attention aujourd'hui à \(weather.name) le taux d'humidité sera moyennement haut avec \(weather.main.humidity.roundDouble() + "% d'humidité"), attention des petites pluies sont prévue."
                              }
                              else {
                                  notificationContent.body = "Aujourd'hui à \(weather.name) aucun milimètre d'eau n'est attendu, le taux d'humidité sera faible avec \(weather.main.humidity.roundDouble() + "% d'humidité")"
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
                              
                              let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 7,
                                                                              repeats: false)
                              let request = UNNotificationRequest(identifier: "Information pluie de la journée",
                                                                  content: notificationContent,
                                                                  trigger: trigger)
                              
                              userNotificationCenter.add(request) { (error) in
                                  if let error = error {
                                      print("Notification Error: ", error)
                                  }
                              }                          },
                          label: {
                            Image(systemName: "cloud.rain")
                                  .font(.title2)
                                  .accentColor(.white)
                          })
                        .padding(.trailing)
                    }
                    
                    HStack {
                        Text("Information ensoleillement")
                            .fontWeight(.light)
                        Spacer()
                        
                        Button(
                            action: {
                                
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
                                
                                let userNotificationCenter = UNUserNotificationCenter.current()

                                let notificationContent = UNMutableNotificationContent()
                                notificationContent.title = "Information ensoleillement"
                                notificationContent.body = "Aujourd'hui, le soliel ce lévera à \(String(describing: strDate + "h")) et en fin de journée le soleil ce couchera à \(String(describing: strDate2 + "h"))"
                                notificationContent.badge = NSNumber(value: 3)
                                
                                if let url = Bundle.main.url(forResource: "dune",
                                                             withExtension: "png") {
                                    if let attachment = try? UNNotificationAttachment(identifier: "dune",
                                                                                      url: url,
                                                                                      options: nil) {
                                        notificationContent.attachments = [attachment]
                                    }
                                }
                                
                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 7,
                                                                                repeats: false)
                                let request = UNNotificationRequest(identifier: "Information ensoleillement de la journée",
                                                                    content: notificationContent,
                                                                    trigger: trigger)
                                
                                userNotificationCenter.add(request) { (error) in
                                    if let error = error {
                                        print("Notification Error: ", error)
                                    }
                                }                          },
                          label: {
                            Image(systemName:"star.square")
                                  .font(.title2)
                                  .accentColor(.white)
                          })
                        .padding(.trailing)
                    }
                }
                
                
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
        
    }

struct NotificationCenterView_Previews: PreviewProvider {
  static var previews: some View {
      NotificationCenterView(weather: previewWeather)
  }
}
