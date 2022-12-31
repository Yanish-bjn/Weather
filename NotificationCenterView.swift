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
    @ObservedObject var informationNotifiation = InformationNotification.shared

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
                              
                              let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5,
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
                              
                              let notificationContent = UNMutableNotificationContent()
                              notificationContent.title = "Climat critique"
                              notificationContent.body = "Attention aujourd'hui fort risque de vent avec des vents allant jusqu'a \(String(describing: weather.wind.speed.roundDouble() + "m/s")) on notera également un taux d'humidité éléver de \(String(describing: weather.main.humidity.roundDouble() + "%"))"
                              notificationContent.badge = NSNumber(value: 3)
                              
                              if let url = Bundle.main.url(forResource: "dune",
                                                           withExtension: "png") {
                                  if let attachment = try? UNNotificationAttachment(identifier: "dune",
                                                                                    url: url,
                                                                                    options: nil) {
                                      notificationContent.attachments = [attachment]
                                  }
                              }
                              
                              let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5,
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

                              let notificationContent = UNMutableNotificationContent()
                              notificationContent.title = "Information pluie"
                              notificationContent.body = "Bonjour"
                              notificationContent.badge = NSNumber(value: 3)
                              
                              if let url = Bundle.main.url(forResource: "dune",
                                                           withExtension: "png") {
                                  if let attachment = try? UNNotificationAttachment(identifier: "dune",
                                                                                    url: url,
                                                                                    options: nil) {
                                      notificationContent.attachments = [attachment]
                                  }
                              }
                              
                              let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5,
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
                                notificationContent.body = "Aujourd'hui, le soliel ce lévera à \(String(describing: strDate + "h")), en fin de journée le soleil ce couchera à \(String(describing: strDate2 + "h"))"
                                notificationContent.badge = NSNumber(value: 3)
                                
                                if let url = Bundle.main.url(forResource: "dune",
                                                             withExtension: "png") {
                                    if let attachment = try? UNNotificationAttachment(identifier: "dune",
                                                                                      url: url,
                                                                                      options: nil) {
                                        notificationContent.attachments = [attachment]
                                    }
                                }
                                
                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5,
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
