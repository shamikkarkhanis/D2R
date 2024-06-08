//
//  DateItemsViewModel.swift
//  Dates2Remember
//
//  Created by Shamik Karkhanis on 6/3/24.
//

import Foundation
import FirebaseFirestore

class EventItemsViewModel: ObservableObject {
    @Published var showingNewEventView = false
    init()  {
        
    }
    
    func deleteEvent(at offsets: IndexSet, for events: [EventItem], userId: String) {
        for index in offsets {
            let event = events[index]
            if let eventId = event.id {
                let db = Firestore.firestore()
                db.collection("users").document(userId).collection("events").document(eventId).delete { error in
                    if let error = error {
                        print("Error removing document: \(error)")
                    } else {
                        print("Document successfully removed!")
                    }
                }
            }
        }
    }
}
