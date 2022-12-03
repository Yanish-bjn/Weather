//
//  InformationNotification.swift
//  Weather
//
//  Created by Yanish Bhujun on 31/10/2022.
//

import Foundation
import UserNotifications
import SwiftUI


class InformationNotification: ObservableObject  {
    
        static let shared = InformationNotification()
    
        let userNotificationCenter = UNUserNotificationCenter.current()
        
    func sendNotification() {
        
        var weather: ResponseBody?

            let notificationContent = UNMutableNotificationContent()
            notificationContent.title = "Bilan de la journée"
        notificationContent.body = "Aujourd'hui, il fera un minimum de \(String(describing: weather?.name))"
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
            }
        }
    
    func climat_critique() {
        
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Climat critique"
        notificationContent.body = "Aujourd'hui, il fera un minimum de"
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
        }
    }
    
    func info_pluie() {
        
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Information pluie"
        notificationContent.body = "Aujourd'hui, il fera un minimum de"
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
        }
    }
    
    func info_soleil() {
        
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Information ensoleillement"
        notificationContent.body = "Aujourd'hui, il fera un minimum de"
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
        }
    }
}
    
