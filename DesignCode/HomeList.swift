//
//  HomeList.swift
//  DesignCode
//
//  Created by Rob Fazio on 10/20/19.
//  Copyright © 2019 Rob Fazio. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0 ..< 3) { item in
                    CourseView()
                }
            }
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
    var body: some View {
        VStack(alignment: .leading) {
            Text("Build an App with SwiftUI")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(20)
                .lineLimit(4)
                .frame(width: 150)
            Spacer()
            Image("Illustration1")
        }
        .background(Color("background3"))
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: Color("backgroundShadow3"), radius: 20, x: 0, y: 20)
    }
}
