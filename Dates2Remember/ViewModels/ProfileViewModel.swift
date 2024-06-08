//
//  ProfileViewModel.swift
//  Dates2Remember
//
//  Created by Shamik Karkhanis on 6/3/24.
//

import Foundation
import FirebaseAuth

class ProfileViewModel: ObservableObject {
    init()  {
        
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out", signOutError)
        }
        
    }
}
