//
//  AppDelegate.swift
//  Custom Notification Interface
//
//  Created by Davis Allie on 26/9/16.
//  Copyright © 2016 Tuts+. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let center = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert]
        
        center.requestAuthorization(options: options) { (authorized, error) in
            if authorized {
                let categoryId = "com.tutplus.Custom-Notification-Interface.notification"
                
                let category = UNNotificationCategory(identifier: categoryId, actions: [], intentIdentifiers: [], options: [])
                center.setNotificationCategories([category])
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 30, repeats: false)
                let content = UNMutableNotificationContent()
                content.categoryIdentifier = categoryId
                content.title = "Notification Title"
                content.subtitle = "Notification Subtitle"
                content.body = "Notification body text"
                content.userInfo = ["customNumber": 100]
                
                let request = UNNotificationRequest(identifier: "exampleNotification", content: content, trigger: trigger)
                center.add(request, withCompletionHandler: nil)
            }
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

