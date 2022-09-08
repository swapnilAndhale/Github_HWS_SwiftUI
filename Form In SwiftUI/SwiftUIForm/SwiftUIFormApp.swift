//
//  SwiftUIFormApp.swift
//  SwiftUIForm
//
//  Created by Swapnil on 7/9/2022.
//

import SwiftUI

@main
struct SwiftUIFormApp: App {
    var settingStore = SettingStore()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(settingStore)
        }
    }
}
