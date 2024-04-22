//
//  Case2View.swift
//  TCA-Demo
//
//  Created by mohamed ramadan on 22/04/2024.
//

import SwiftUI
import ComposableArchitecture

// parent view
struct Case2View: View {
    
    @State var store: StoreOf<Case2Reducer>
    var body: some View {
        
        VStack(spacing: 20) {
            Text(store.parentTitle)
            
            TextField("Enter Title" , text: $store.parentTitle)
                .textFieldStyle(.roundedBorder)
            
            Button {
                store.send(.sendFromParent)
            } label: {
             Text("Click from parent")
            }
            
            Divider()
            Case2ChildView(store: store.scope(state: \.childState, action: \.childActions))
            
        }.padding(20)
    }
}

#Preview {
    Case2View(store: Store(initialState: Case2Reducer.State(), reducer: {
        Case2Reducer()
    }))
}

///"-----------------------------------"\\\
///
///

// child view
struct Case2ChildView: View {
    
    @State var store: StoreOf<Case2ChildReducer>
    var body: some View {
        
        VStack(spacing: 20) {
            Text(store.childTitle)
            
            TextField("Enter Title" , text: $store.childTitle)
                .textFieldStyle(.roundedBorder)
            
            Button {
                store.send(.sendFromChild)
            } label: {
             Text("Click from Child")
            }
            
            Divider()
            
            
        }.padding(20)
    }
}
