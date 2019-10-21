//
//  HomeList.swift
//  DesignCode
//
//  Created by Rob Fazio on 10/20/19.
//  Copyright © 2019 Rob Fazio. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    
    @State private var showContent = false
    
    private var courses = coursesData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(courses) { item in
                    CourseView(title: item.title, image: item.image, color: item.color, shadowColor: item.shadowColor)
                        .sheet(isPresented: self.$showContent) { ContentView() }
                        .onTapGesture {
                            self.showContent.toggle()
                    }
                }
            }
            .padding(.leading, 30)
            Spacer()
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

struct CourseView: View {
    
    var title = ""
    var image = ""
    var color = Color.white
    var shadowColor = Color.white
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(20)
                .lineLimit(4)
                .padding(.trailing, 50)
            Spacer()
            Image(image)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 246, height: 150)
                .padding(.bottom, 30)
        }
        .background(color)
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}

let coursesData = [
    Course(title: "Build an app with SwiftUI",
           image: "Illustration1",
           color: Color("background3"),
           shadowColor: Color("backgroundShadow3")),
    Course(title: "Design Course",
           image: "Illustration2",
           color: Color("background4"),
           shadowColor: Color("backgroundShadow4"))
]
