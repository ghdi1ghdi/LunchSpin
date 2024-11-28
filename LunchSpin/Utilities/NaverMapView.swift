//
//  NaverMapView.swift
//  LunchSpin
//
//  Created by JeongHo Lee on 11/28/24.
//

import SwiftUI
import NMapsMap

struct NaverMapView: UIViewRepresentable {
    
    @ObservedObject var locationManager: LocationManager // 위치 관리자 추가

    func makeUIView(context: Context) -> NMFNaverMapView {
        let naverMapView = NMFNaverMapView()
        let mapView = naverMapView.mapView // Access the NMFMapView instance
        let locationOverlay = mapView.locationOverlay
        let cameraPosition = mapView.cameraPosition
        
        mapView.positionMode = .compass
        naverMapView.showCompass = true
        naverMapView.showScaleBar = true
        naverMapView.showZoomControls = true
        naverMapView.showLocationButton = true
        locationOverlay.hidden = true

        return naverMapView
    }
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
        guard let userLocation = locationManager.userLocation else { return }
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: userLocation.latitude, lng: userLocation.longitude))
        cameraUpdate.animation = .easeIn
        uiView.mapView.moveCamera(cameraUpdate)
    }
}
