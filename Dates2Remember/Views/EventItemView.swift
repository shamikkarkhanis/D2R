//
//  DateItemView.swift
//  Dates2Remember
//
//  Created by Shamik Karkhanis on 6/3/24.
//

import SwiftUI

struct EventItemView: View {
    let event: EventItem
    
    var body: some View {
        HStack() {
            Text(event.title)
                .font(.body)
                .fontWeight(.heavy)
            Spacer()
            Text("\(Date(timeIntervalSince1970: event.date).formatted(date: .abbreviated, time: .omitted))")
                .font(.body)
    
            
            
        }
    }
}

#Preview {
    EventItemView(event: .init(id: "123", title: "finish app", date: Date().timeIntervalSince1970, freq: 3, createDate: Date().timeIntervalSince1970))
}
