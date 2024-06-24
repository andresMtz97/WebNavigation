//
//  AppDelegate.swift
//  WebNavigation
//
//  Created by Rafael González on 26/04/24.
//

import UIKit
import Network

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var internetStatus = false
    var internetType = ""
    var internetIsExpensive = false
    let monitor = NWPathMonitor()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Add code to detect network connection
        monitor.start(queue:DispatchQueue.global(qos: .default))
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.internetStatus = true
                
                //Detects connection type
                if path.usesInterfaceType(.wifi){
                    self.internetType = "WiFi"
                }
                else if path.usesInterfaceType(.cellular){
                    self.internetType = "Cellular"
                } else if path.usesInterfaceType(.wiredEthernet) {
                    self.internetType = "Wired Ethernet"
                }
                else {
                    self.internetType = "Unknown"
                }
                //Detects if it is expensive
//                if path.isExpensive {
//                    self.internetIsExpensive = true
//                }
            }
            else {
                self.internetStatus = false
            }
            
            print("internetType: ",self.internetType.description)
            print("internetStatus: ",self.internetStatus.description)
            print("internetIsExpendive: ",self.internetIsExpensive.description)
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

