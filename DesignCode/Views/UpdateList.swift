//
//  UpdateList.swift
//  DesignCode
//
//  Created by Rob Fazio on 10/21/19.
//  Copyright © 2019 Rob Fazio. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    
    @ObservedObject var store = UpdateStore(updates: updateData)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.updates) { item in
                    NavigationLink(destination: UpdateDetails(title: item.title, text: item.text, image: item.image)) {
                        HStack(spacing: 12.0) {
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(Color("background"))
                                .cornerRadius(20)
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                Text(item.text)
                                    .lineLimit(2)
                                    .lineSpacing(4)
                                    .font(.subheadline)
                                    .frame(height: 50.0)
                                Text(item.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding(.vertical, 8.0)
                }
                .onDelete { (index) in
                    self.store.updates.remove(at: index.first!)
                }
                .onMove(perform: move)
            }
            .navigationBarTitle(Text("Updates"))
            .navigationBarItems(leading:
                Button(action: addUpdate) {
                    Text("Add Update")
                        .foregroundColor(.white)
                }
                .padding(8)
                .background(Color("background3"))
                .cornerRadius(8)
                , trailing: EditButton()
            )
        }
    }
    
    func addUpdate() {
        store.updates.append(Update(image: "Certificate1", title: "New Title", text: "New Text", date: "JUL 1"))
    }
    
    func move(from source: IndexSet, to destination: Int) {
        store.updates.move(fromOffsets: source, toOffset: destination)
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}
