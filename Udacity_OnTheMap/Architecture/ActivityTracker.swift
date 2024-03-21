//
//  ActivityTracker.swift
//  MovieSwiftUI
//
//  Created by Work on 15/03/2023.
//

import Combine

public typealias ActivityTracker = CurrentValueSubject<Bool, Never>

extension Publisher where Failure: Error {
    public func trackActivity(_ activityTracker: ActivityTracker) -> AnyPublisher<Output, Failure> {
        return handleEvents(receiveSubscription: { _ in
            activityTracker.send(true)
        }, receiveCompletion: { _ in
            activityTracker.send(false)
        })
        .eraseToAnyPublisher()
    }
}
