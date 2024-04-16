//
//  MapViewModel.swift
//  Udacity_OnTheMap
//
//  Created by Work on 30/03/2024.
//

import Combine
import UIKit

struct MapViewModel {
    
    let useCase: LocationUseCaseType
}

extension MapViewModel: ViewModel {
    
    class Input: ObservableObject {
        var loadTrigger = PassthroughSubject<Void, Never>()
        @Published var openLinkTrigger: String = ""
    }
    
    class Output: ObservableObject {
        @Published var locationViewItemList: [LocationViewItem] = []
        @Published var alertMessage = AlertMessage()
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        let errorTracker = ErrorTracker()
        let activityTracker = ActivityTracker(false)
        
        errorTracker.map {
            AlertMessage(error: $0)
        }
        .assign(to: \.alertMessage, on: output)
        .store(in: cancelBag)
        
        input.loadTrigger
            .flatMap {
                useCase.getLocationList()
                    .asDriver()
                    .trackError(errorTracker)
                    .trackActivity(activityTracker)
            }
            .map {
                MapTranslator.createLocationViewItemList(from: $0)
            }
            .assign(to: \.locationViewItemList, on: output)
            .store(in: cancelBag)
        
        input.$openLinkTrigger
            .compactMap { string in
                return URL(string: string)
            }
            .flatMap { url in
                openURL(url)
                    .trackError(errorTracker)
                    .trackActivity(activityTracker)
                    .asDriver()
            }
            .sink(receiveValue: { url in
                UIApplication.shared.open(url)
            })
            .store(in: cancelBag)
        
        return output
    }
}


func openURL(_ url: URL) -> AnyPublisher<URL, Error> {
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
