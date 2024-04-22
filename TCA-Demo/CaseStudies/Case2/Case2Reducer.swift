//
//  Case2Reducer.swift
//  TCA-Demo
//
//  Created by mohamed ramadan on 22/04/2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct Case2Reducer {
    
    @ObservableState
    struct State: Equatable {
        var parentTitle = ""
        var childState = Case2ChildReducer.State()
        
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case sendFromParent
        case childActions(Case2ChildReducer.Action)
    }
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
             case .sendFromParent:
                state.childState.childTitle = state.parentTitle
                return .none
            case .binding(_):
                return .none
            case .binding(\.parentTitle):
                print(state.parentTitle)
                return .none
            case .childActions(.sendFromChild):
                state.parentTitle = state.childState.childTitle
                return .none
            case .childActions(_):
                return .none
            }
            
        }
        
        Scope(state: \.childState, action: \.childActions) {
            Case2ChildReducer()
        }
    }
}

//====================================//

@Reducer
struct Case2ChildReducer {
    
    @ObservableState
    struct State: Equatable {
        var childTitle = ""
        
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case sendFromChild
    }
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
             case .sendFromChild:
                return .none
            case .binding(_):
                return .none
            case .binding(\.childTitle):
                print(state.childTitle)
                return .none
            }
            
        }
    }
}

