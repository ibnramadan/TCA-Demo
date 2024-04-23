//
//  Case3Test.swift
//  TCA-DemoTests
//
//  Created by mohamed ramadan on 23/04/2024.
//

import XCTest
@testable import TCA_Demo
import ComposableArchitecture

@MainActor
final class Case3Test: XCTestCase {

    func testApi() async throws {
        let store = TestStore(initialState: Case3Reducer.State()) {
            Case3Reducer()
        } withDependencies: { dep in
            dep.context = .test
        }
        
        await store.send(.buttonTappedAction)
        await store.receive(\.buttonTappedResponse) { state in
            state.title = "test"
        }
    }
}
