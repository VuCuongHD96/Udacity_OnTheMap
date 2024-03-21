//
//  LoginViewModel.swift
//  Udacity_OnTheMap
//
//  Created by Work on 21/03/2024.
//

import Combine

struct LoginViewModel {
    
}

extension LoginViewModel: ViewModel {
    
    class Input: ObservableObject {
        @Published var emailValue = ""
        @Published var passwordValue = ""
    }
    
    class Output {
        
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
     let output = Output()
        return output
    }
}
