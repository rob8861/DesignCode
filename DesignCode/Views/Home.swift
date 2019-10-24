//
//  Home.swift
//  DesignCode
//
//  Created by Rob Fazio on 10/20/19.
//  Copyright © 2019 Rob Fazio. All rights reserved.
//

import SwiftUI

func statusBarHeight() -> CGFloat {
    let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    return window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
}

let screen = UIScreen.main.bounds

struct Home: View {
    
    @State private var show = false
    @State private var showProfile = false
    
    var body: some View {
        
        ZStack {
            
            HomeList()
                .blur(radius: show ? 20 : 0)
                .scaleEffect(showProfile ? 0.95 : 1)
                .animation(.default)
            
            ContentView()
                .frame(minWidth: 0, maxWidth: 712)
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring())
                .offset(y: showProfile ? statusBarHeight() + 40 : UIScreen.main.bounds.height)
            
            MenuButton(show: $show)
                .offset(x: -40, y: showProfile ? statusBarHeight() : 80)
                .animation(.spring())
            
            MenuRight(show: $showProfile)
                .offset(x: -16, y: showProfile ? statusBarHeight() : 88)
                .animation(.spring())
            
            MenuView(show: $show)
        }
        .background(Color("background"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct MenuRowView: View {
    
    var image = "creditcard"
    var text = "My Account"
    
    @State private var show = false
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 32, height: 32)
            if text == "Settings" {
                Button(action: { self.show.toggle() }) {
                    Text(text)
                        .foregroundColor(.primary)
                        .font(.headline)
                }
                .sheet(isPresented: $show) {
                    Settings()
                }
            } else {
                Text(text)
                    .font(.headline)
            }
            
            Spacer()
        }
    }
}

struct Menu: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}

let menuData = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Settings", icon: "gear"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.2"),
    Menu(title: "Sign Out", icon: "arrow.uturn.down")
]

struct MenuView: View {
    
    var menu = menuData
    @Binding var show: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                
                ForEach(menu) { item in
                    MenuRowView(image: item.icon, text: item.title)
                }
                
                Spacer()
            }
            .padding(30)
            .frame(minWidth: 0, maxWidth: 360)
            .background(Color("button"))
            .cornerRadius(30)
            .padding(.trailing, 60)
            .shadow(radius: 20)
            .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
            .animation(.default)
            .offset(x: show ? 0 : -UIScreen.main.bounds.width, y: 0)
            .onTapGesture {
                self.show.toggle()
            }
            Spacer()
        }
        .padding(.top, statusBarHeight())
    }
}

struct CircleButton: View {
    
    var icon = ""
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(Color.primary)
        }
        .frame(width: 44, height: 44)
        .background(Color("button"))
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
    }
}

struct MenuButton: View {
    
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.show.toggle()
                }) {
                    HStack {
                        Spacer()
                        Image(systemName: "list.dash")
                            .foregroundColor(.primary)
                    }
                    .padding(.trailing, 18)
                    .frame(width: 90, height: 60)
                    .background(Color("button"))
                    .cornerRadius(30)
                    .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct MenuRight: View {
    
    @Binding var show: Bool
    @State private var showUpdateList = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                HStack {
                    Button(action: {
                        self.show.toggle()
                    }) {
                        CircleButton(icon: "person.crop.circle")
                    }
                    Button(action: {
                        self.showUpdateList.toggle()
                    }) {
                        CircleButton(icon: "bell")
                    }
                    .sheet(isPresented: $showUpdateList) {
                        UpdateList()
                    }
                }
            }
            Spacer()
        }
    }
}
