//
//  PlinicApp.swift
//  Plinic
//
//  Created by MacBook Air on 2022/07/29.
//

import SwiftUI

@main
struct PlinicApp: App {
    
    @UIApplicationDelegateAdaptor var appDelegate : MyAppDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
