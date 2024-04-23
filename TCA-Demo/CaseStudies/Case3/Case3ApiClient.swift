//
//  Case3ApiClient.swift
//  TCA-Demo
//
//  Created by mohamed ramadan on 22/04/2024.
//

import Foundation
import ComposableArchitecture

struct Case3ApiClient {
    var fetch: () async throws -> String
}

extension Case3ApiClient: DependencyKey {
    static var liveValue = Case3ApiClient {
        let (data, _) = try await URLSession.shared.data(from: URL(string: "http://numbersapi.com/10/trivia")!)
        return String(decoding: data, as: UTF8.self)
    }
    static var testValue = Case3ApiClient {
        return "test"
    }
}

extension DependencyValues {
    var case3ApiClient: Case3ApiClient {
        get {
            self[Case3ApiClient.self]
        }
        
        set {
            self[Case3ApiClient.self] = newValue
        }
    }
}
