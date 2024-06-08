//
//  RegisterViewModel.swift
//  Dates2Remember
//
//  Created by Shamik Karkhanis on 6/4/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var pass = ""
    @Published var errmessage = ""
    
    init() {}
     
    func register() {
        guard validate() else {return}
        
        Auth.auth().createUser(withEmail: email, password: pass) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
            
        }
            
    }
        
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
         
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty, !email.trimmingCharacters(in: .whitespaces).isEmpty, !pass.trimmingCharacters(in: .whitespaces).isEmpty else {
            errmessage = "Please complete all fields"
            return false
        }
        return true
    }
}
