//
//  UserUseCase.swift
//  Udacity_OnTheMap
//
//  Created by Work on 22/03/2024.
//

import Foundation

protocol UserUseCaseType {
    func login(user: UserData) -> Observable<Void>
}

struct UserUseCase: UserUseCaseType {
    
    let userRepository: UserRepositoryType
    
    func login(user: UserData) -> Observable<Void> {
        return userRepository.login(user: user)
    }
}
