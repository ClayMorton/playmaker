//
//  Play_MakerApp.swift
//  Play Maker
//
//  Created by Clay Morton on 12/7/24.
//

import SwiftUI

@main
struct MyApp: App {
    @StateObject private var playData = PlayData()
    
    var body: some Scene {
        WindowGroup {
            HomeScreenView()
                .environmentObject(playData)
        }
    }
}

