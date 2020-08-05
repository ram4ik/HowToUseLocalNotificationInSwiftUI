//
//  LocalNotificationManager.swift
//  HowToUseLocalNotificationInSwiftUI
//
//  Created by ramil on 05.08.2020.
//

import Foundation
import SwiftUI

class LocalNotificationManager: ObservableObject {
    
    var notifications = [Notification]()
    
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted == true && error == nil {
                print("The notifications has beed permitted")
            } else {
                print("The notifications has not beed permitted")
            }
        }
    }
    
    func sendNotifications(title: String, subTitle: String?, body: String, launchIn: Double) {
        
        let content = UNMutableNotificationContent()
        content.title = title
        
        if let subtitle = subTitle {
            content.subtitle = subtitle
        }
        content.body = body
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: launchIn, repeats: false)
        let request = UNNotificationRequest(identifier: "demonotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }

}

