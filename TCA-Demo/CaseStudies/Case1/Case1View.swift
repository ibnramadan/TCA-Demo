//
//  Case1View.swift
//  TCA-Demo
//
//  Created by mohamed ramadan on 22/04/2024.
//

import SwiftUI
import ComposableArchitecture
struct Case1View: View {
    
    @State var store: StoreOf<Case1Reducer>
    var body: some View {
        VStack {
            Text(store.title)
            TextField("Enter a text", text: $store.title)
                .textFieldStyle(.roundedBorder)
        } .padding()
    }
}

#Preview {
    Case1View(store: Store(initialState: Case1Reducer.State(), reducer: {
        Case1Reducer()
    }))
}
