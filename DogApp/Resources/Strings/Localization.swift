//
//  Localization.swift
//  DogApp
//
//  Created by Jose Francisco Rosales Hernandez on 06/06/25.
//

import Foundation

enum Strings {
    
    enum NetworkError {
        static var badURL: LocalizedStringResource { "network.bad_url" }
        static func decodingError(_ detail: String) -> LocalizedStringResource {
            .init("network.decoding_error \(detail)")
        }
        static func requestFailed(_ detail: String) -> LocalizedStringResource {
            .init("network.request_failed \(detail)")
        }
        static func invalidStatusCode(_ code: Int) -> LocalizedStringResource {
            .init("network.invalid_status_code \(code)")
        }
        static var noData: LocalizedStringResource { "network.no_data" }
    }
    
    enum DogsList {
        static let loadingError: LocalizedStringResource = "dogsList.loadingError"
        static let navigationTitle: LocalizedStringResource = "dogsList.navigationTitle"
        static let loadingTitle: LocalizedStringResource = "dogsList.loadingTitle"
        static let retryButtonTitle: LocalizedStringResource = "dogsList.retryButtonTitle"
        static let noDogsAvailableMessage: LocalizedStringResource = "dogsList.noDogsAvailableMessage"
    }
    
    enum DogCard {
        static func dogAgeTitle(_ age: Int) -> LocalizedStringResource {
            .init("Almost \(age) year")
        }
    }
}
