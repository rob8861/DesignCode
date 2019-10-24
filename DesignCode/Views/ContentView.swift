//
//  ContentView.swift
//  DesignCode
//
//  Created by Rob Fazio on 10/20/19.
//  Copyright © 2019 Rob Fazio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var show = false // animation state
    @State private var viewState = CGSize.zero // positioning
    
    var body: some View {
        ZStack {
            
            BlurView(style: .systemMaterial)
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardBottomView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardView()
                .background(show ? Color.red : Color("background9"))
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
//                .rotation3DEffect(Angle(degrees: show ? 50 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.7))
                .offset(x: viewState.width, y: viewState.height)
            
            CardView()
                .background(show ? Color.red : Color("background8"))
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
//                .rotation3DEffect(Angle(degrees: show ? 40 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
                .offset(x: viewState.width, y: viewState.height)
            
            CertificateView()
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
//                .rotation3DEffect(Angle(degrees: show ? 30 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 10, initialVelocity: 0))
                .onTapGesture {
                    self.show.toggle()
            }
            .gesture(
                DragGesture()
                    .onChanged({ (value) in
                        // value is the positioning of the drag
                        self.viewState = value.translation
                        self.show = true
                    })
                    .onEnded({ (value) in
                        self.viewState = CGSize.zero
                        self.show = false
                    })
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            Text("Placeholder")
        }
        .frame(width: 340.0, height: 220)
        
    }
}

struct CertificateView: View {
    
    var item: Certificate = Certificate(title: "UI Design", image: "Background", width: 340, height: 220)
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color("accent"))
                        .padding(.top)
                        .padding(.bottom)
                    Text(/*@START_MENU_TOKEN@*/"Cetificate"/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                }
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 30.0, height: 30)
            }
            .padding(.horizontal)
            Spacer()
            Image(item.image)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .offset(y: 50)
        }
        .frame(width: CGFloat(item.width), height: CGFloat(item.height))
        .background(Color.black)
        .cornerRadius(10.0)
        .shadow(radius: 10)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
            }
            Image("Illustration5")
                .resizable()
                .frame(width: 120, height: 120)
            Spacer()
        }.padding()
    }
}

struct CardBottomView: View {
    var body: some View {
        VStack(spacing: 20.0) {
            Rectangle()
                .frame(width: 60, height: 6)
                .cornerRadius(3.0)
                .opacity(0.1)
            Text("This cetificate is a proof that you have completed the course Design+Code.")
                .lineLimit(10)
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .padding(.horizontal)
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(x: 0, y: 600)
    }
}
