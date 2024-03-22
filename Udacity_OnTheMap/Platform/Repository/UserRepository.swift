//
//  UserRepository.swift
//  Udacity_OnTheMap
//
//  Created by Work on 22/03/2024.
//

import Combine

protocol UserRepositoryType {
    func login(user: UserData) -> Observable<Void>
}

class UserRepository: ServiceBaseRepository, UserRepositoryType {
    
    func login(user: UserData) -> Observable<Void> {
        let request = LoginRequest(user: user)
        return api.request(input: request)
            .map { (data: LoginResponse) in
                return Void()
            }
            .eraseToAnyPublisher()
    }
}
