//
//  OpenURL.swift
//  Udacity_OnTheMap
//
//  Created by Work on 8/5/24.
//

import Combine
import UIKit

func openURL(_ url: URL?) -> Observable<URL> {
    guard let url = url else {
        return Fail(error: BaseError.redirectionError)
            .eraseToAnyPublisher()
    }
    return Future<URL, Error> { promise in
        UIApplication.shared.open(url, options: [:]) { result in
            if result {
                promise(.success(url))
            } else {
                promise(.failure(BaseError.redirectionError))
            }
        }
    }
    .eraseToAnyPublisher()
}
