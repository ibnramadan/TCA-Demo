//
//  TCA_DemoApp.swift
//  TCA-Demo
//
//  Created by mohamed ramadan on 22/04/2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_DemoApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            NavigationStack {
                NavigationLink {
                    Case1View(store: Store(initialState: Case1Reducer.State(), reducer: {
                        Case1Reducer()
                    }))
                } label: {
                    Text("Case 1")
                }
            }
        }
    }
}
