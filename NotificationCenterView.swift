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
                              InformationNotification.shared.sendNotification()
                          },
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
                            // 1
                            NotificationManager.shared.requestAuthorization { granted in
                              // 2
                              if granted {
                              }
                            }
                          },
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
                            // 1
                            NotificationManager.shared.requestAuthorization { granted in
                              // 2
                              if granted {
                              }
                            }
                          },
                          label: {
                            Image(systemName: "cloud.rain")
                                  .font(.title2)
                                  .accentColor(.white)
                          })
                        .padding(.trailing)
                    }
                    
                    HStack {
                        Text("Information soleil")
                            .fontWeight(.light)
                        Spacer()
                        
                        Button(
                          action: {
                            // 1
                            NotificationManager.shared.requestAuthorization { granted in
                              // 2
                              if granted {
                              }
                            }
                          },
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
    NotificationCenterView()
  }
}
