//
//  HomeView.swift
//  LunchSpin
//
//  Created by JeongHo Lee on 11/28/24.
//

import SwiftUI
import ComposableArchitecture


struct HomeView: View {
    @StateObject private var locationManager = LocationManager()
    let store: StoreOf<HomeFeature>

    var body: some View {
        VStack {
            NaverMapView(locationManager: LocationManager()).edgesIgnoringSafeArea(.all)
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(store.title)")
            Button("Tap me") {
                store.send(.buttonClicked)
                print(store.state.isButtonClicked)
            }
            
        }
        .padding()
    }
}

#Preview {
  HomeView(
    store: Store(initialState: HomeFeature.State()) {
      HomeFeature()
    }
  )
}
