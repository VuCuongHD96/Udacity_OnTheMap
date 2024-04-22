//
//  UserRepository.swift
//  Udacity_OnTheMap
//
//  Created by Work on 22/03/2024.
//

import Combine

protocol UserRepositoryType {
    func login(user: UserData) -> Observable<LoginResponse>
    func logout() -> Observable<Void>
    func getUserInfo(id: String) -> Observable<UserInfoResponse>
}

class UserRepository: ServiceBaseRepository, UserRepositoryType {
    
    func login(user: UserData) -> Observable<LoginResponse> {
        let request = LoginRequest(user: user)
        return api.request(input: request)
            .map { (data: LoginResponse) in
                return data
            }
            .eraseToAnyPublisher()
    }
    
    func logout() -> Observable<Void> {
        let request = LogoutRequest()
        return api.request(input: request)
            .map { (data: LogoutResponse) in
                return Void()
            }
            .eraseToAnyPublisher()
    }
    
    func getUserInfo(id: String) -> Observable<UserInfoResponse> {
        let request = UserInfoRequest(id: id)
        return api.request(input: request)
            .map { (data: UserInfoResponse) in
                return data
            }
            .eraseToAnyPublisher()
    }
}
