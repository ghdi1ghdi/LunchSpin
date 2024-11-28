//
//  LunchSpinApp.swift
//  LunchSpin
//
//  Created by JeongHo Lee on 11/28/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct LunchSpinApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(
              store: Store(initialState: HomeFeature.State()) {
                HomeFeature()
              }
            )
        }
    }
}
