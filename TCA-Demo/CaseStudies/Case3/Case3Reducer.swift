//
//  Case3Reducer.swift
//  TCA-Demo
//
//  Created by mohamed ramadan on 22/04/2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct Case3Reducer {
    
    @Dependency(\.case3ApiClient) var apiClient
    
    @ObservableState
    struct State: Equatable {
        var title = "Hello World"
    }
    
    enum Action {
        case buttonTappedAction
        case buttonTappedResponse(String)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .buttonTappedAction:
                
                return .run { send in
                    let data = try await apiClient.fetch()
                    await send(.buttonTappedResponse(data))
                }
            case .buttonTappedResponse(let title):
                state.title = title
                return .none
            }
        }
    }
}
