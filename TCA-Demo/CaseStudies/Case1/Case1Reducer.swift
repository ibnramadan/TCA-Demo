//
//  Case1Reducer.swift
//  TCA-Demo
//
//  Created by mohamed ramadan on 22/04/2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct Case1Reducer {
    
    @ObservableState
    struct State: Equatable {
        var title = ""
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
    }
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding(\.title):
                print(state.title)
                return .none
                
            case .binding:
                return .none
            }
        }
    }
}
