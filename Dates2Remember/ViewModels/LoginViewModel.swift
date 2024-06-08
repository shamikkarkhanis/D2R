//
//  LoginViewModel.swift
//  Dates2Remember
//
//  Created by Shamik Karkhanis on 6/3/24.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errmessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {return}
        
        //try login
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errmessage = "Please complete all fields"
            return false
        }
        
        return true
    }
}
