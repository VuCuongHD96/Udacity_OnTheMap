//
//  AlertMessage.swift
//  Udacity_OnTheMap
//
//  Created by Work on 9/4/24.
//

import Foundation

struct AlertMessage {
    public var title = ""
    public var message = ""
    public var isShowing = false
    
    public init() { }
    
    public init(title: String, message: String, isShowing: Bool) {
        self.title = title
        self.message = message
        self.isShowing = isShowing
    }
}

extension AlertMessage {
    init(error: BaseError) {
        let title = error.title
        let message = error.errorMessage ?? ""
        let isShowing = !message.isEmpty
        self.init(title: title, message: message, isShowing: isShowing)
    }
    
    init(error: Error) {
        let title = "Error!"
        let message = error.localizedDescription
        let isShowing = !message.isEmpty
        self.init(title: title, message: message, isShowing: isShowing)
    }
}
