//
//  Case3View.swift
//  TCA-Demo
//
//  Created by mohamed ramadan on 22/04/2024.
//

import SwiftUI
import ComposableArchitecture

struct Case3View: View {
    @State var store: StoreOf<Case3Reducer>
    var body: some View {
        VStack(spacing: 32){
            Text(store.title)
            
            Button("Press me") {
                store.send(.buttonTappedAction)
            }
        }
    }
}

#Preview {
    Case3View(store: Store(initialState: Case3Reducer.State(), reducer: {
        Case3Reducer()
    }))
}
