//
//  Settings.swift
//  DesignCode
//
//  Created by Rob Fazio on 10/23/19.
//  Copyright © 2019 Rob Fazio. All rights reserved.
//

import SwiftUI

struct Settings: View {
    
    @State private var receive = false
    @State private var number = 1
    @State private var selection = 1
    @State private var date = Date()
    @State private var email = ""
    @State private var submit = false
    
    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $receive) {
                    Text("Receive notifications")
                }
                Stepper(value: $number, in: 1...10) {
                    Text("\(number) Notification\(number > 1 ? "s" : "") per week")
                }
                Picker(selection: $selection, label: Text("Favorite Course")) {
                    Text("SwiftUI").tag(1)
                    Text("React").tag(2)
                }
                DatePicker(selection: $date) { Text("Date") }
                
                Section(header: Text("Email")) {
                    TextField("Your email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack {
                    Spacer()
                    Button(action: { self.submit.toggle() }) {
                        Text("Submit")
                    }
                    .alert(isPresented: $submit) {
                        Alert(title: Text("Thanks!"), message: Text("Email: \(email)"))
                    }
                    Spacer()
                }
            }
            .navigationBarTitle(Text("Settings"))
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
