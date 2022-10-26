//
//  NotificationSettingsView.swift
//  Weather
//
//  Created by Athisayah Nalliah on 26/10/2022.
//

import SwiftUI

struct NotificationCenterView: View {
  @ObservedObject var notificationManager = NotificationManager.shared

  var body: some View {
    VStack {
      Form {
        Section {
          HStack {
            Spacer()
            Text("Notification Center")
              .font(.title2)
            Spacer()
          }
        }
        Section {
          CenterRowView(
            setting: "Authorization Status",
            enabled: notificationManager.settings?.authorizationStatus == UNAuthorizationStatus.authorized)
          CenterRowView(
            setting: "Alerts Enabled?",
            enabled: notificationManager.settings?.alertSetting == .enabled)
          CenterRowView(
            setting: "Show on lock screen?",
            enabled: notificationManager.settings?.lockScreenSetting == .enabled)
          CenterRowView(
            setting: "Alert banners?",
            enabled: notificationManager.settings?.alertStyle == .banner)
          CenterRowView(
            setting: "Critical Alerts?",
            enabled: notificationManager.settings?.criticalAlertSetting == .enabled)
          
        }
      }
    }

  }
}

struct NotificationCenterView_Previews: PreviewProvider {
  static var previews: some View {
    NotificationCenterView()
  }
}

struct CenterRowView: View {
  var setting: String
  var enabled: Bool
  var body: some View {
    HStack {
      Text(setting)
      Spacer()
      if enabled {
        Image(systemName: "checkmark")
          .foregroundColor(.green)
      } else {
        Image(systemName: "xmark")
          .foregroundColor(.red)
      }
    }
    .padding()
  }
}
