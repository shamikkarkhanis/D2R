//
//  DateItemsView.swift
//  Dates2Remember
//
//  Created by Shamik Karkhanis on 6/3/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct EventItemsView: View {
    @StateObject var viewModel = EventItemsViewModel()
    @FirestoreQuery var events: [EventItem]
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        self._events = FirestoreQuery(collectionPath: "users/\(userId)/events")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(events) { event in
                        EventItemView(event: event)
                    }
                    .onDelete { offsets in
                        viewModel.deleteEvent(at: offsets, for: events, userId: userId)
                    }
                }
            }
            .navigationTitle("Events")
            .toolbar {
                Button {
                    viewModel.showingNewEventView = true
                } label: {
                    Image(systemName: "plus") 
                }
            }
            .sheet(isPresented: $viewModel.showingNewEventView, content: {
                NewEventItemView(newEventPresented: $viewModel.showingNewEventView)
            })
        }
    }
}

#Preview {
    EventItemsView(userId: "C7y8HTp4MUMar8OghJblQutRDMK2")
}
