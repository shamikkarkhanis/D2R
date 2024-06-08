//
//  NewDateItemViewModel.swift
//  Dates2Remember
//
//  Created by Shamik Karkhanis on 6/3/24.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore

class NewEventItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var date = Date()
    @Published var showAlert = false
    @Published var frequency: Frequency = .daily
    
    init()  {
        
    }
    
    func save() {
        guard canSave else {
            return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        //create model
        let newId = UUID().uuidString
        let newEvent = EventItem(id: newId, title: title, date: date.timeIntervalSince1970, freq: 3, createDate: Date().timeIntervalSince1970)
        
        //save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("events")
            .document(newId)
            .setData(newEvent.asDictionary())
    }
    
    enum Frequency: String, CaseIterable, Identifiable {
        case daily, weekly, monthly, yearly
        
        var id: String { self.rawValue }
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard date >= Date().addingTimeInterval(-864000) else {
            return false
        }
        
        return true
    }
}
