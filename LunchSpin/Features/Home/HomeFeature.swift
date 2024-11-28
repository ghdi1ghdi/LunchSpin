//
//  HomeFeature.swift
//  LunchSpin
//
//  Created by JeongHo Lee on 11/28/24.
//

import ComposableArchitecture

@Reducer
struct HomeFeature {
    @ObservableState
    struct State: Equatable {
        var title: String = "Hello, World!"
        var isButtonClicked = false
    }
    
    enum Action: Equatable {
        case buttonClicked
    }
    
    var body: some ReducerOf<Self> {
        Reduce { State, action in
            switch action {
            case .buttonClicked:
                State.isButtonClicked = true
                State.title = "Button Clicked"
                return .none
            }
        }
    }
    
}

