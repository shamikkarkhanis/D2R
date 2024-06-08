//
//  NewDateItemView.swift
//  Dates2Remember
//
//  Created by Shamik Karkhanis on 6/3/24.
//

import SwiftUI

struct NewEventItemView: View {
    
    @StateObject var viewModel = NewEventItemViewModel()
    @Binding var newEventPresented: Bool
    
    var body: some View {
        VStack {
            
            
            Text("New Event")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            
            Form {
                //Title
                TextField("Event Name", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //Date
                DatePicker("Date", selection: $viewModel.date, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                Picker("Frequency", selection: $viewModel.frequency) {
                    ForEach(NewEventItemViewModel.Frequency.allCases) { frequency in
                        Text(frequency.rawValue.capitalized).tag(frequency)
                    }
                }
                .padding(.bottom, 2)
                    
                
                //Button
                Button {
                    if viewModel.canSave {
                        viewModel.save()
                        newEventPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.green)
                        
                        Text("Add Event")
                            .foregroundColor(.white)
                        
                    }
                    
                }
                
                
                .alert(isPresented: $viewModel.showAlert, content: {
                    Alert(title: Text("Error"), message: Text("Complete all fields correctly"))
                })
        
            }
        }
    }
}

#Preview {
    NewEventItemView(newEventPresented: Binding(get: {return true}, set: {_ in}))
}
