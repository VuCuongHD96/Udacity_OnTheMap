//
//  UserUseCase.swift
//  Udacity_OnTheMap
//
//  Created by Work on 22/03/2024.
//

import Foundation

protocol UserUseCaseType {
    func login(user: UserData) -> Observable<LoginResponse>
    func logout() -> Observable<Void>
    func getUserInfo(id: String) -> Observable<UserInfoResponse>
}

struct UserUseCase: UserUseCaseType {
    
    let userRepository: UserRepositoryType
    
    func login(user: UserData) -> Observable<LoginResponse> {
        return userRepository.login(user: user)
            .mapError {
                if case .internetError = $0 as? BaseError {
                    return $0
                } else {
                    return BaseError.loginError
                }
            }
            .eraseToAnyPublisher()
    }
    
    func logout() -> Observable<Void> {
        return userRepository.logout()
    }
    
    func getUserInfo(id: String) -> Observable<UserInfoResponse> {
        return userRepository.getUserInfo(id: id)
    }
}
