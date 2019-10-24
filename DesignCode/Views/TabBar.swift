//
//  TabBar.swift
//  DesignCode
//
//  Created by Rob Fazio on 10/22/19.
//  Copyright © 2019 Rob Fazio. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem {
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                }
            }.tag(1)
            ContentView().tabItem {
                VStack {
                    Image(systemName: "doc.richtext")
                    Text("Certificates")
                }
            }.tag(2)
            Settings().tabItem {
                VStack {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            }.tag(3)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar()
                //.environment(\.colorScheme, .dark)
                .environment(\.sizeCategory, .extraLarge)
        }
    }
}
