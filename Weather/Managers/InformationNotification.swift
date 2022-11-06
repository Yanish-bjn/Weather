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
             
             let notificationContent = UNMutableNotificationContent()
             notificationContent.title = "Bilan de la journée"
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
             let request = UNNotificationRequest(identifier: "Bilan de la journée",
                                                 content: notificationContent,
                                                 trigger: trigger)
             
             userNotificationCenter.add(request) { (error) in
                 if let error = error {
                     print("Notification Error: ", error)
                 }
             }
         }
    }



